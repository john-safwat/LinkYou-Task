import 'package:flutter/material.dart';
import 'package:linkyou_task/Core/Base/base_state.dart';
import 'package:linkyou_task/Core/Colors/colors_manager.dart';
import 'package:linkyou_task/Domain/UseCase/get_users_list_use_case.dart';
import 'package:linkyou_task/Presentation/Home/Widgets/user_item.dart';
import 'package:linkyou_task/Presentation/Home/home_navigator.dart';
import 'package:linkyou_task/Presentation/Home/home_view_model.dart';
import 'package:provider/provider.dart';
class HomeView extends StatefulWidget {
  static const String routeName = "home";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseStateState<HomeView , HomeViewModel> implements HomeNavigator {

  @override
  void initState() {
    super.initState();
    viewModel.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(   
        create: (context) => viewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            if(value.errorMessage != null){
              return Center(
                child: Text(value.errorMessage??""),
              );
            }else if (value.users.isEmpty){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    color: ColorsManager.darkBlue,
                    indent: 60,
                    endIndent: 60,
                  ),
                ),
                controller: value.controller,
                itemCount: value.pageNumber > value.totalPageNumbers? value.users.length : value.users.length+1,
                itemBuilder: (context, index) {
                  if(index != value.users.length){
                    return UserItem(value.users[index]);
                  }else {
                    viewModel.loadData();
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child:CircularProgressIndicator()),
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel(
      injectGetUsersListUseCase()
    );
  }
}
