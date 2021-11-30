import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:new_flutter_assignment/models/character.dart';

class CharacterListItem extends HookWidget {
  final Character character;

  const CharacterListItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              child: Opacity(
                opacity: 0.8,
                child: Image.network(
                  character.image ?? '',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Get Schwifty',
                    fontSize: 20,
                    letterSpacing: 2,
                    color: Colors.white),
              ),
            ),
          ],
        ));
  }
}


















/*class CharacterListItem extends HookWidget {
  final Character character;

  const CharacterListItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        //padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        width: double.infinity,
        child: Column(
          children: [
            Container(child: Image.network(character.image ?? ''), width: 150),
            SizedBox(width: 25),
            Text(character.name ?? ''),
          ],
        ));
  }
}*/
//width: 150