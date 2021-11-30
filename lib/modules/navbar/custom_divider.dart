import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey,
      height: 30.0,
      thickness: 2.0,
      endIndent: 50.0,
      indent: 50.0,
    );
  }
}
