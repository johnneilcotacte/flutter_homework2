import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, Function() func) {
  // Create button
  Widget okButton = TextButton(
    child: Text('OK'),
    onPressed: func,
  );
  Widget cancelButton = TextButton(
    child: Text('CANCEL'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog _alert = AlertDialog(
    title: Text('Blog Update'),
    content: Text('Are you sure you want to delete this?'),
    actions: [
      cancelButton,
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return _alert;
    },
  );
}
