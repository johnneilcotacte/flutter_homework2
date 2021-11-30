import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/config/routes.dart';
import 'package:new_flutter_assignment/providers/const_provider.dart';

//run in flutter run -d chrome --web-port 5000

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: App()));
  //FirebaseMessaging.instance.getToken().then(print);
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error.toString()}'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return ProviderScope(child: MyApp());
        }
        return Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        );
      },
    );
  }
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final constants = useProvider(constantsProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter HomeWork2',
      theme: ThemeData(
        primaryColor: constants.kPrimaryColor,
        scaffoldBackgroundColor: constants.kBgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: constants.kPrimaryColor),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: constants.kBodyTextColor),
          bodyText2: TextStyle(color: constants.kBodyTextColor),
          headline5: TextStyle(color: constants.kDarkBlackColor),
        ),
      ),
      initialRoute: RouteGenerator.blogRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
