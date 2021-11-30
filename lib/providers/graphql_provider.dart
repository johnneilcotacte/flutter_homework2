import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/api/graphql_api.dart';
import 'package:new_flutter_assignment/models/character.dart';
import 'package:new_flutter_assignment/providers/graphql_api_provider.dart';

final charactersProvider = ChangeNotifierProvider(

    // ignore: top_level_function_literal_block
    (ref) {
  final charactersGraphQL = ref.watch(initialgraphqlProvider).characters;

  return CharactersNotifier(charactersAPI: charactersGraphQL);
});

class CharactersNotifier extends ChangeNotifier {
  final CharactersGraphQL charactersAPI;
  int _page = 1;
  CharactersNotifier({
    required this.charactersAPI,
  }) {
    _page = charactersAPI.getcurrentPage();
  }
  int get page => _page;

  List<Character> _characters = [];

  List<Character> get characters => _characters;

  Map<String, dynamic> _infos = {};

  Map<String, dynamic> get info => _infos;

  Future<List<Character>> getCharacters() async {
    //change this parameter
    final data = await charactersAPI.getCharacters(); // List<Characters>

    // _characters = data; //original

    if (_characters.isNotEmpty && data.isNotEmpty) {
      _characters = [
        ..._characters,
        ...data,
      ];
    } else if (_characters.isEmpty && data.isNotEmpty) {
      _characters = data;
    }
    return _characters;
  }

  Future<Map<String, dynamic>> getPages() async {
    //change this parameter
    final information = await charactersAPI.getInfo(); // List<Characters>

    // _characters = data; //original

    return _infos = information;
  }

  getCurrentPage() {
    return _page = charactersAPI.getcurrentPage();
  }
}
