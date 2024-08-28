import 'package:flutter/material.dart';
import 'package:linkyou_task/Core/Assets/animation_assets.dart';
import 'package:linkyou_task/Core/Colors/colors_manager.dart';
import 'package:linkyou_task/Domain/UseCase/sign_in_with_google_use_case.dart';
import 'package:linkyou_task/Presentation/Home/home_view.dart';
import 'package:lottie/lottie.dart';
import 'package:linkyou_task/Core/Assets/images_assets.dart';
import 'package:linkyou_task/Core/Base/base_state.dart';
import 'package:linkyou_task/Presentation/Login/login_navigator.dart';
import 'package:linkyou_task/Presentation/Login/login_view_model.dart';

class LoginView extends StatefulWidget {
  static const String routeName = "/";

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseStateState<LoginView, LoginViewModel>
    implements LoginNavigator {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ImagesAssets.screenBackgroundImage,
          ),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0 , horizontal: 8),
                child: Text("Welcome to \nLinkYou.Ca" , style: TextStyle(
                    color: ColorsManager.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 36
                ),),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Lottie.asset(AnimationAssets.helloAnimation,
                    fit: BoxFit.cover,)
                  ),
                  ElevatedButton(
                    onPressed: viewModel.login,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(AnimationAssets.googleLogoAnimation , height: 40 ),
                            const SizedBox(width: 8,),
                            const Text("Login With Google")
                          ],
                        ),
                      )

                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel(
      injectSignInWithGoogleUseCase()
    );
  }

  @override
  navigateToHomeScreen() {
    Navigator.pushNamed(context, HomeView.routeName);
  }
}
