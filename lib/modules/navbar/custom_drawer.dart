import 'package:flutter/material.dart';
import 'package:new_flutter_assignment/config/routes.dart';
import 'package:new_flutter_assignment/models/screen_argument.dart';
import 'package:new_flutter_assignment/modules/navbar/appbarbutton.dart';
import 'package:new_flutter_assignment/modules/navbar/custom_divider.dart';

class CustomEndDrawer extends StatelessWidget {
  CustomEndDrawer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            AppBarButton(
              title: 'Blog',
              onTap: () {
                Navigator.pushNamed(context, '${RouteGenerator.blogRoute}',
                    arguments: ScreenArguments(null));
              },
            ),
            CustomDivider(),
            AppBarButton(
              title: 'GraphQL',
              onTap: () {
                Navigator.pushNamed(context, '${RouteGenerator.graphqlRoute}',
                    arguments: ScreenArguments(null));
              },
            ),
          ],
        ),
      ),
    );
  }
}
