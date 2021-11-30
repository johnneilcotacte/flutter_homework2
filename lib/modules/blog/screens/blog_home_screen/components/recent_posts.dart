import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/config/routes.dart';
import 'package:new_flutter_assignment/models/screen_argument.dart';
import 'package:new_flutter_assignment/modules/blog/screens/blog_home_screen/components/recentpostcard.dart';
import 'package:new_flutter_assignment/modules/blog/screens/blog_home_screen/components/sidebar_container.dart';
import 'package:new_flutter_assignment/providers/blogs_provider.dart';

class RecentPosts extends HookWidget {
  final bool isLoaded;
  const RecentPosts({Key? key, required this.isLoaded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _blogProvider = useProvider(blogProvider);

    return SidebarContainer(
      title: "Recent Post",
      child: (isLoaded)
          ? Center(
              child: CircularProgressIndicator(
                  color: Colors.black, strokeWidth: 2),
            )
          : (_blogProvider.blogPosts.length > 0)
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: (_blogProvider.blogPosts.length >= 2) ? 2 : 1,
                  itemBuilder: (context, index) {
                    int reverseIndex =
                        _blogProvider.blogPosts.length - 1 - index;

                    return RecentPostCard(
                      image: _blogProvider.blogPosts[reverseIndex].image,
                      title: _blogProvider.blogPosts[reverseIndex].title!,
                      subtitle: _blogProvider.blogPosts[reverseIndex].subtitle!,
                      press: () {
                        Navigator.pushNamed(
                            context, '${RouteGenerator.viewblogRoute}',
                            arguments: ScreenArguments(
                                _blogProvider.blogPosts[index]));
                      },
                    );
                  },
                )
              : Center(
                  child: Text('No Blog Posted.'),
                ),
    );
  }
}
