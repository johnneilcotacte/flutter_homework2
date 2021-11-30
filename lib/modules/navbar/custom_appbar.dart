import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flutter_assignment/config/routes.dart';
import 'package:new_flutter_assignment/models/screen_argument.dart';
import 'package:new_flutter_assignment/modules/navbar/appbarbutton.dart';
import 'package:new_flutter_assignment/modules/responsive.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar({Key? key})
      : super(
          ///height of appbar
          preferredSize: Size(double.infinity, 50.0),
          child: Container(),
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.0,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'JN',
                style: GoogleFonts.pacifico(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 25,
                    letterSpacing: 2.0),
              ),
            ),
            Responsive.isDesktop(context)
                ? Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppBarButton(
                            title: 'Blog',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '${RouteGenerator.blogRoute}',
                                  arguments: ScreenArguments(null));
                            }),
                        SizedBox(
                          width: 40,
                        ),
                        AppBarButton(
                            title: 'GraphQL',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '${RouteGenerator.graphqlRoute}',
                                  arguments: ScreenArguments(null));
                            }),
                        SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  )
          ],
        ));
  }
}
