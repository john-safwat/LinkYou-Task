import 'package:linkyou_task/Data/Models/Registration_response.dart';
import 'package:linkyou_task/Data/Models/users_response_DTO.dart';

abstract class UsersRemoteDataSource{

  Future<RegistrationResponse> createUser(String userName);
  Future<UsersResponseDto> getUsersList(int pageNumber);
}