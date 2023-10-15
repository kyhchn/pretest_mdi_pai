import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pretest_mdi_pai/app/widgets/form_input.dart';
import 'package:sizer/sizer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pretest'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: controller.fetch,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.h),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: FormInput(
                    hint: 'search',
                    inputType: TextInputType.text,
                    onFieldSubmitted: (value) => controller.fetch(),
                    suffixIcon: IconButton(
                        onPressed: controller.fetch,
                        icon: const Icon(Icons.search)),
                    controller: controller.nameEditingController),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(controller.users[index].image),
                          ),
                          title: Text(controller.users[index].fullName),
                          subtitle: Text(controller.users[index].email),
                          trailing:
                              Text(controller.users[index].age.toString()),
                        ),
                      );
                    },
                    itemCount: controller.users.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
