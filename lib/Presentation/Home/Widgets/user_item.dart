import 'package:flutter/material.dart';
import 'package:linkyou_task/Domain/Models/MyUser.dart';

class UserItem extends StatelessWidget {
  final MyUser user;
  const UserItem(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(user.avatar??""),
        ),
        const SizedBox(width: 16,),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${user.firstName} ${user.lastName}"),
                Text(user.email??"")
              ],
            )
        )
      ],
    );
  }
}
