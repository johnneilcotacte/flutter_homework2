import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final googleSignInProvider =
    ChangeNotifierProvider<GoogleSignInNotifier>((ref) {
  return GoogleSignInNotifier();
});

class GoogleSignInNotifier extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogIn() async {
    final googleuser = await googleSignIn.signIn();
    if (googleuser == null) return;
    _user = googleuser;

    final googleAuth = await googleuser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }

  Future googleLogOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}

/*final initialgoogleSignInProvider = Provider<GoogleSignInNotifier>((ref) {
  return GoogleSignInNotifier();
});

class GoogleSignInNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future<void> googleLogIn() async {
    await googleSignIn.signIn();
    /*final googleuser = await googleSignIn.signIn();
    if (googleuser == null) return;
    _user = googleuser;

    final googleAuth = await googleuser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);*/
  }
}
*/