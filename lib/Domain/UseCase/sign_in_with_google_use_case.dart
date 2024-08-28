import 'package:firebase_auth/firebase_auth.dart';
import 'package:linkyou_task/Data/Repository/users_repository_impl.dart';
import 'package:linkyou_task/Domain/Reposiotry/users_repository_contract.dart';


SignInWithGoogleUseCase injectSignInWithGoogleUseCase() {
  return SignInWithGoogleUseCase(injectUsersRepository());
}

class SignInWithGoogleUseCase {

  final UsersRepository repository;

  const SignInWithGoogleUseCase(this.repository);

  Future<String> invoke() async {
    var user = await repository.signInWithGoogle();
    var id = await repository.createUser(user.displayName??"John");
    return id;
  }

}