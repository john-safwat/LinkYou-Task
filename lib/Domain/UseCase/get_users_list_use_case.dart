import 'package:linkyou_task/Data/Repository/users_repository_impl.dart';
import 'package:linkyou_task/Domain/Models/MyUser.dart';
import 'package:linkyou_task/Domain/Reposiotry/users_repository_contract.dart';

GetUsersListUseCase injectGetUsersListUseCase(){
  return GetUsersListUseCase(injectUsersRepository());
}

class GetUsersListUseCase {

  final UsersRepository repository;
  const GetUsersListUseCase(this.repository);

  Future<(List<MyUser>, int)> invoke(int pageNumber) async {
    var response = await repository.getUsersList(pageNumber);
    return response;
  }

}