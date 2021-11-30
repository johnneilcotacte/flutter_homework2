import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/providers/const_provider.dart';

class RecentPostCard extends HookWidget {
  final Uint8List? image;
  final String title;
  final String subtitle;
  final VoidCallback press;

  const RecentPostCard({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _constants = useProvider(constantsProvider);
    return Padding(
      padding: EdgeInsets.only(bottom: _constants.kDefaultPadding - 5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Row(
            children: [
              /* Expanded(
                flex: 2,
                child: Image.memory(image!),
              ),*/
              Container(
                width: 120,
                height: 80,
                child: Image.memory(
                  image!,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: _constants.kDefaultPadding),
              Expanded(
                flex: 5,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Raleway",
                          color: _constants.kDarkBlackColor,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(subtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: "Raleway",
                            color: _constants.kDarkBlackColor,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.start),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
