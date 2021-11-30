import 'dart:typed_data';

class Blog {
  final String? id;
  final String? title;
  final String? subtitle;
  final String? content;
  final String? date;
  final Uint8List? image;

  Blog(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.content,
      required this.date,
      required this.image});
}
