import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuthDatabase injectFirebaseAuthDatabase(){
  return FirebaseAuthDatabase.getInstance();
}

class FirebaseAuthDatabase {

  FirebaseAuthDatabase._();
  static FirebaseAuthDatabase? instance;
  static getInstance(){
    return instance??=FirebaseAuthDatabase._();
  }


  final _firebase = FirebaseAuth.instance;

  // login the user using google account
  Future<User> signInWithGoogle()async {
    await GoogleSignIn().signOut();
    final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    final user = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await _firebase.signInWithCredential(user);
    return _firebase.currentUser!;
  }

}