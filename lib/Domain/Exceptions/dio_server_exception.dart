import 'package:dio/dio.dart';

class DioServerException implements Exception {
  final DioExceptionType errorMessage ;
  const DioServerException(this.errorMessage);
}