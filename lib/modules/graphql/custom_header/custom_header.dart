import 'package:flutter/material.dart';
import 'package:new_flutter_assignment/modules/responsive.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: height * .75,
      child: Stack(
        alignment: (Responsive.isMobile(context))
            ? Alignment.center
            : AlignmentDirectional.topStart,
        children: [
          Positioned(
            right: 0,
            child: Container(
              height: height * .75,
              width: (!Responsive.isMobile(context)) ? width * .75 : width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/rick_and_morty.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //gradient
          Positioned(
            right: 0,
            child: Container(
              width: (!Responsive.isMobile(context)) ? width * .78 : width,
              height: height * .75,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: (!Responsive.isMobile(context))
                      ? Alignment.topLeft
                      : Alignment.bottomCenter,
                  end: (!Responsive.isMobile(context))
                      ? Alignment.topRight
                      : Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: (!Responsive.isMobile(context)) ? 50 : null,
            child: Container(
              height: (!Responsive.isMobile(context)) ? height * .75 : null,
              width: (!Responsive.isMobile(context)) ? width * .25 : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'RICK AND MORTY',
                    style: TextStyle(
                        fontFamily: 'Get Schwifty',
                        fontSize:
                            (Responsive.isDesktop(context)) ? width * .03 : 42,
                        letterSpacing: 2,
                        color: Colors.lightGreen),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'CHARACTERS',
                    style: TextStyle(
                        fontFamily: 'Get Schwifty',
                        fontSize: (!Responsive.isDesktop(context))
                            ? width * .027
                            : 37,
                        letterSpacing: 2,
                        color: Colors.lightGreen),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
