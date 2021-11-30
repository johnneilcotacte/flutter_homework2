import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/providers/const_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final constants = useProvider(constantsProvider);
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: height * .75,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: constants.kDarkBlackColor,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.8), BlendMode.dstATop),
                    image: AssetImage(
                      'assets/images/food.jpg',
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Food Blogs',
                style: GoogleFonts.dancingScript(
                    color: Colors.white, fontSize: 52),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
