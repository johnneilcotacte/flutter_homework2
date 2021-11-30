import 'package:graphql/client.dart';
import 'package:new_flutter_assignment/config/graphql.dart';
import 'package:new_flutter_assignment/models/character.dart';

class CharactersGraphQL {
  /// Schema of the query
  /// Write the variable name and put the schema inside. Wrap r'''<Schema> ''';
  ///
  int _page = 1;

  String _getCharacters = r'''
  query GetCharacters($page: Int){
    characters(page: $page) {
      results {
        id
        name
        image
      }
    }
  }
  ''';

  String _getInfo = r'''
  query GetCharacters{
    characters{
      info{
        count
        pages
        next
        prev
      }
    }
  }
  ''';

  // The function that calls the API
  Future<List<Character>> getCharacters() async {
    //write the document

    final options = QueryOptions(document: gql(_getCharacters), variables: {
      'page': _page, //1
    });

    final response = await graphQlClient.query(options);

    if (!response.hasException) {
      final List<Object?> data = response.data!['characters']['results'];

      final values = data.map(
          (character) => Character.fromJson(character as Map<String, dynamic>));

      _page++;

      return values.toList();
    } else {
      print(response.exception);

      return [];
    }
  }

  Future<Map<String, dynamic>> getInfo() async {
    //write the document

    // final options = QueryOptions(document: gql(_getInfo));
    final options = QueryOptions(document: gql(_getInfo));

    final response = await graphQlClient.query(options);

    if (!response.hasException) {
      final data = response.data!['characters']['info'];
      return data;
    } else {
      print(response.exception);

      return {};
    }
  }

  int getcurrentPage() {
    return _page;
  }
}
