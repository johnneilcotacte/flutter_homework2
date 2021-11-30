import 'package:new_flutter_assignment/models/blog.dart';

class BlogPostChecker {
  static bool isComplete(Blog blog) {
    if (blog.id != '' &&
        blog.title != '' &&
        blog.subtitle != '' &&
        blog.content != '' &&
        blog.date != '' &&
        blog.image != null) {
      return true;
    }
    return false;
  }
}
