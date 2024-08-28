import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:linkyou_task/Data/API/api_manager.dart';
import 'package:linkyou_task/Data/Models/Registration_response.dart';
import 'package:linkyou_task/Data/Models/users_response_DTO.dart';
import 'package:linkyou_task/Domain/DataSource/users_remote_data_source_contract.dart';
import 'package:linkyou_task/Domain/Exceptions/bad_network_connection_exception.dart';
import 'package:linkyou_task/Domain/Exceptions/dio_server_exception.dart';
import 'package:linkyou_task/Domain/Exceptions/operation_timeout_exception.dart';
import 'package:linkyou_task/Domain/Exceptions/unknown_exception.dart';

UsersRemoteDataSource injectUsersRemoteDataSource(){
  return UsersRemoteDataSourceImpl(injectApiManager());
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {

  final ApiManager apiManager;
  const UsersRemoteDataSourceImpl(this.apiManager);

  @override
  Future<RegistrationResponse> createUser(String userName) async {
    try {
      var response = await apiManager
          .createUser(userName)
          .timeout(const Duration(seconds: 100));
      return response;
    } on DioException catch (e) {
      throw DioServerException(e.type);
    } on TimeoutException {
      throw const OperationTimeoutException("Operation Timed Out Try Again");
    } on IOException {
      throw const BadNetworkConnectionException("Check Your Internet Connection");
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<UsersResponseDto> getUsersList(int pageNumber) async {
    try {
      var response = await apiManager
          .getUsersList(pageNumber)
          .timeout(const Duration(seconds: 100));
      return response;
    } on DioException catch (e) {
      throw DioServerException(e.type);
    } on TimeoutException {
      throw const OperationTimeoutException("Operation Timed Out Try Again");
    } on IOException {
      throw const BadNetworkConnectionException("Check Your Internet Connection");
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

}