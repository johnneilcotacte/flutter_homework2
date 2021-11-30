/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_flutter_assignment/models/blog.dart';
import 'package:new_flutter_assignment/providers/blogs_api_provider.dart';

final blogProvider = ChangeNotifierProvider<StreamNotifier>((ref) {
  final initialdata = ref.watch(initialblogProvider).dummydata;
  return StreamNotifier();
});

class StreamNotifier extends ChangeNotifier {


  Future getStatus(snaphot) async {

  final _stream = FirebaseAuth.instance.authStateChanges();
if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error while signing up'),
          );
        } else if (snapshot.hasData) {
          return MainScreenBlogs();
        } else {
          return SignIn();
        }
  }

}*/
