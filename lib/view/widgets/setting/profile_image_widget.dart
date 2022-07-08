import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fshop/logic/controller/auth_controller.dart';
import 'package:fshop/view/widgets/text_utils.dart';
import 'package:get/get.dart';

class ProfileImageWidget extends StatelessWidget {
  ProfileImageWidget({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage:
           authController.userImage.value.toString() != ""?
           NetworkImage(
            authController.userImage.value.toString()
          )
          :
          const AssetImage("assets/images/empty_proile.png" )as ImageProvider,
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${authController.displayUserName}".capitalize!,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "${authController.userEmail}",
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
            ),
          ],
        )
      ],
    ),);
  }
}
