import 'package:flutter/material.dart';
import 'package:new_flutter_assignment/config/routes.dart';

showConfirmationDialog(BuildContext context, String content) {
  Widget okButton = TextButton(
    child: Text('OK'),
    onPressed: () {
      //Navigator.of(context).pop();
      Navigator.popUntil(
          context, ModalRoute.withName(RouteGenerator.blogRoute));
    },
  );

  AlertDialog _alert = AlertDialog(
    title: Text('Blog Update'),
    content: Text(content),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return _alert;
    },
  );
}
