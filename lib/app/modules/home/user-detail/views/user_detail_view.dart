import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/user_detail_controller.dart';

class UserDetailView extends GetView<UserDetailController> {
  const UserDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Hero(
              tag: controller.bulkUser.id,
              child: CircleAvatar(
                radius: 10.h,
                backgroundImage: NetworkImage(
                    controller.user.value?.image ?? controller.bulkUser.image),
              ),
            ),
          )
        ],
      ),
    )));
  }
}
