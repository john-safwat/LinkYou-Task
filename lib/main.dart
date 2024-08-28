import 'package:flutter/material.dart';
import 'package:linkyou_task/Core/Theme/app_theme.dart';
import 'package:linkyou_task/Presentation/Home/home_view.dart';
import 'package:linkyou_task/Presentation/Login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      routes: {
        LoginView.routeName : (_)=> const LoginView(),
        HomeView.routeName : (_) => HomeView()
      },
      initialRoute: LoginView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}