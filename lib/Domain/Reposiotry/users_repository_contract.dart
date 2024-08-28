import 'package:firebase_auth/firebase_auth.dart';
import 'package:linkyou_task/Domain/Models/MyUser.dart';

abstract class UsersRepository {

  Future<User> signInWithGoogle();
  Future<String> createUser(String userName);
  Future<(List<MyUser> , int)> getUsersList(int pageNumber);

}