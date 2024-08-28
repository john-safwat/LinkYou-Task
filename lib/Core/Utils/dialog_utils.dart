import 'package:flutter/material.dart';
import 'package:linkyou_task/Core/Utils/negative_action_button.dart';
import 'package:linkyou_task/Core/Utils/pos_action_button.dart';
import 'package:lottie/lottie.dart';

class MyDialogUtils {
  static Future<void> showLoadingDialog({
    required BuildContext context,
    required String message,
  }) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          contentPadding:const EdgeInsets.all(30),
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 20,
              ),
              FittedBox(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
        barrierColor: Colors.black.withOpacity(0.7),
        barrierDismissible: false);
  }

  static showDialogOnScreen({
    required BuildContext context,
    required String message ,
    required String imagePath,
    String? posActionTitle ,
    VoidCallback? posAction,
    String? negativeActionTitle,
    VoidCallback? negativeAction,
  }) {

    List<Widget> actionList = [];

    // add the button to the action list if it doesn't equal null
    if(negativeActionTitle != null){
      if(negativeAction != null){
        actionList.add(NegativeActionButton(negativeActionTitle: negativeActionTitle , negativeAction: negativeAction,));
      }else {
        actionList.add(NegativeActionButton(negativeActionTitle: negativeActionTitle));
      }
    }

    // add the button to the action list if it doesn't equal null
    if(posActionTitle != null){
      if (actionList.isNotEmpty){
        actionList.add(const SizedBox(width: 20,));
      }
      if(posAction != null){
        actionList.add(PosActionButton(posActionTitle: posActionTitle , posAction: posAction,));
      }else{
        actionList.add(PosActionButton(posActionTitle: posActionTitle));
      }
    }


    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          contentPadding: EdgeInsets.zero,
          content: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding:const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:const BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        )
                      ),
                      child: Center(child: Lottie.asset(imagePath ,width: 120 ,fit: BoxFit.cover )),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: actionList,
                ),
              )
            ],
          ),
        ),
        barrierColor: Colors.black.withOpacity(0.7),
        barrierDismissible: false);
  }
}
