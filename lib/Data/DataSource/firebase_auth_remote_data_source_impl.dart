import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:linkyou_task/Data/Firebase/firebase_auth_database.dart';
import 'package:linkyou_task/Domain/DataSource/firebase_auth_remote_data_source_contract.dart';
import 'package:linkyou_task/Domain/Exceptions/bad_network_connection_exception.dart';
import 'package:linkyou_task/Domain/Exceptions/firebase_google_sign_in_exception.dart';
import 'package:linkyou_task/Domain/Exceptions/operation_timeout_exception.dart';
import 'package:linkyou_task/Domain/Exceptions/unknown_exception.dart';

FirebaseAuthRemoteDataSource injectFirebaseAuthRemoteDataSource() {
  return FirebaseAuthRemoteDataSourceImpl(injectFirebaseAuthDatabase());
}

class FirebaseAuthRemoteDataSourceImpl implements FirebaseAuthRemoteDataSource {
  final FirebaseAuthDatabase database;

  const FirebaseAuthRemoteDataSourceImpl(this.database);

  @override
  Future<User> signInWithGoogle() async {
    try {
      var response = await database
          .signInWithGoogle()
          .timeout(const Duration(seconds: 100));
      return response;
    } on FirebaseAuthException catch (e) {
      throw FirebaseGoogleSignInException(e.code);
    } on TimeoutException {
      throw const OperationTimeoutException("Operation Timed Out Try Again");
    } on IOException {
      throw const BadNetworkConnectionException("Check Your Internet Connection");
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }
}
