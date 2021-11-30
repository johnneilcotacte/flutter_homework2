import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/api/fake_blog_api.dart';

final initialblogProvider = Provider<FakeBlogAPI>((ref) {
  return FakeBlogAPI();
});

class FakeBlogAPI {
  final dummydata = InitialDummyBlog();
}
