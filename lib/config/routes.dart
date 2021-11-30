import 'package:flutter/material.dart';
import 'package:new_flutter_assignment/modules/blog/screens/blog_editor_screen/blog_editor.dart';
import 'package:new_flutter_assignment/modules/blog/screens/blog_home_screen/main_screen_blogs.dart';
import 'package:new_flutter_assignment/modules/blog/screens/expanded_view_screen/blogfullscreen.dart';
import 'package:new_flutter_assignment/modules/graphql/screen/graphql_characters.dart';

class RouteGenerator {
  static const String blogRoute = '/blogs/home';
  static const String composeblogRoute = '/blogs/compose';
  static const String editblogRoute = '/blogs/edit';
  static const String viewblogRoute = '/blogs/view';
  static const String graphqlRoute = '/graphql';
  static const String bonusRoute = '/bonus';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case blogRoute:
        return MaterialPageRoute(
          builder: (context) => _RouteHandler(routeWidget: MainScreenBlogs()),
          settings: settings,
        );
      case composeblogRoute:
        return MaterialPageRoute(
          builder: (context) => _RouteHandler(routeWidget: BlogEditor()),
          settings: settings,
        );
      case viewblogRoute:
        return MaterialPageRoute(
          builder: (context) => _RouteHandler(routeWidget: FullScreen()),
          settings: settings,
        );
      case editblogRoute:
        return MaterialPageRoute(
          builder: (context) => _RouteHandler(routeWidget: BlogEditor()),
          settings: settings,
        );
      case graphqlRoute:
        return MaterialPageRoute(
          builder: (context) => _RouteHandler(routeWidget: GraphqlPage()),
          settings: settings,
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
            appBar: AppBar(title: Text('Error')),
            body: Center(
              child: Text('Page not found!'),
            )));
  }
}

class _RouteHandler extends StatelessWidget {
  final Widget routeWidget;

  const _RouteHandler({Key? key, required this.routeWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return routeWidget;
  }
}
