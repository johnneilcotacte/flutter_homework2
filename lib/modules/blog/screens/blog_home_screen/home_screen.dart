import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/modules/blog/screens/blog_home_screen/components/compose.dart';
import 'package:new_flutter_assignment/modules/responsive.dart';
import 'package:new_flutter_assignment/providers/blogs_provider.dart';
import 'package:new_flutter_assignment/providers/const_provider.dart';
import 'components/blog_post_card.dart';
import 'components/recent_posts.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isLoading = useState(false);
    final _blogprovider = useProvider(blogProvider);
    final _constants = useProvider(constantsProvider);
    _loadData() async {
      _isLoading.value = true;

      try {
        await _blogprovider.getBlogs();
      } on Exception catch (error) {
        print(error);
      }

      _isLoading.value = false;
    }

    useEffect(() {
      _loadData();

      return;
    }, []);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: (_isLoading.value)
              ? Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 3,
                  ),
                )
              : Container(
                  child: (_blogprovider.blogPosts.length > 0)
                      ? ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: _blogprovider.blogPosts.length,
                          itemBuilder: (context, index) {
                            return BlogPostCard(
                                blog: _blogprovider.blogPosts[index]);
                          },
                        )
                      : Center(
                          child: Text('No Blog Posted.'),
                        ),
                ),
        ),
        if (!Responsive.isMobile(context))
          SizedBox(width: _constants.kDefaultPadding),
        if (!Responsive.isMobile(context))
          Expanded(
            child: Column(
              children: <Widget>[
                Compose(),
                SizedBox(height: _constants.kDefaultPadding),
                RecentPosts(
                  isLoaded: _isLoading.value,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
