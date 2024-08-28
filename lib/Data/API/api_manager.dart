import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:linkyou_task/Data/API/api_manager_constants.dart';
import 'package:linkyou_task/Data/Models/Registration_response.dart';
import 'package:linkyou_task/Data/Models/users_response_DTO.dart';

ApiManager injectApiManager() {
  return ApiManager.getInstance();
}

class ApiManager {

  ApiManager._();

  static ApiManager? instance;

  static getInstance() {
    return instance ??= ApiManager._();
  }

  final _dio = Dio();

  Future<RegistrationResponse> createUser(String name) async {
    Uri uri = Uri.https(
        ApiManagerConstants.baseURL, ApiManagerConstants.usersRoute);
    var response = await _dio.postUri(uri, data: {
      "name": name,
      "jop": "Developer"
    });
    return RegistrationResponse.fromJson(response.data);
  }

  Future<UsersResponseDto> getUsersList(int pageNumber) async {
    Uri uri = Uri.https(
        ApiManagerConstants.baseURL, ApiManagerConstants.usersRoute, {
      "page": pageNumber.toString()
    });
    var response = await _dio.getUri(uri);
    return UsersResponseDto.fromJson(response.data);
  }

}