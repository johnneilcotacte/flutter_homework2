import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/api/fake_blog_api.dart';
import 'package:new_flutter_assignment/models/blog.dart';
import 'package:new_flutter_assignment/providers/blogs_api_provider.dart';

final blogProvider = ChangeNotifierProvider<BlogsNotifier>((ref) {
  final initialdata = ref.watch(initialblogProvider).dummydata;
  return BlogsNotifier(blog: initialdata);
});

class BlogsNotifier extends ChangeNotifier {
  final InitialDummyBlog blog;

  List<Blog> _blogList = [];

  BlogsNotifier({
    required this.blog,
  });

  List<Blog> get blogPosts => _blogList;

  Future<List<Blog>> getBlogs() async {
    final data = await blog.initializeListBlog();

    _blogList = data;

    return _blogList;
  }

  Future<void> addBlog({required Blog newblog}) async {
    _blogList = [..._blogList, newblog];

    notifyListeners();
  }

  Future<void> deleteBlog({required String id}) async {
    _blogList.removeWhere((everyblog) => everyblog.id == id);

    notifyListeners();
  }

  Future<void> updateBlog({required Blog updatedBlog}) async {
//https://stackoverflow.com/questions/56283870/how-to-update-a-single-item-in-flutter-list-as-a-best-way/60678253

    _blogList[_blogList.indexWhere(
        (everyblog) => everyblog.id == updatedBlog.id)] = updatedBlog;

    notifyListeners();
  }
}
