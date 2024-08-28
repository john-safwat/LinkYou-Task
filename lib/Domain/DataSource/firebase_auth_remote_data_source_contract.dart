import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthRemoteDataSource{

  Future<User> signInWithGoogle();


}