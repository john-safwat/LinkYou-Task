import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkyou_task/Data/DataSource/firebase_auth_remote_data_source_impl.dart';
import 'package:linkyou_task/Data/DataSource/users_remote_data_source_impl.dart';
import 'package:linkyou_task/Domain/DataSource/firebase_auth_remote_data_source_contract.dart';
import 'package:linkyou_task/Domain/DataSource/users_remote_data_source_contract.dart';
import 'package:linkyou_task/Domain/Models/MyUser.dart';
import 'package:linkyou_task/Domain/Reposiotry/users_repository_contract.dart';

UsersRepository injectUsersRepository() {
  return UsersRepositoryImpl(
      injectFirebaseAuthRemoteDataSource(), injectUsersRemoteDataSource());
}

class UsersRepositoryImpl implements UsersRepository {
  final FirebaseAuthRemoteDataSource firebaseAuthRemoteDataSource;
  final UsersRemoteDataSource usersRemoteDataSource;

  const UsersRepositoryImpl(
      this.firebaseAuthRemoteDataSource, this.usersRemoteDataSource);

  @override
  Future<User> signInWithGoogle() async {
    var response = await firebaseAuthRemoteDataSource.signInWithGoogle();
    return response;
  }

  @override
  Future<String> createUser(String userName) async {
    var response = await usersRemoteDataSource.createUser(userName);
    return response.id ?? "404";
  }

  @override
  Future<(List<MyUser>, int)> getUsersList(int pageNumber) async {

    var response = await usersRemoteDataSource.getUsersList(pageNumber);
    return (
      response.data!.map((e) => e.toDomain()).toList(),
      response.totalPages == null ? 1 : response.totalPages!.toInt()
    );
  }
}
