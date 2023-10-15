import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:pretest_mdi_pai/app/widgets/button.dart';
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
      body: Form(
        key: controller.key,
        child: SafeArea(
            child: RefreshIndicator(
          onRefresh: controller.fetch,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.h),
            child: Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: FormInput(
                      label: 'Name',
                      useDecorationLabel: true,
                      hint: 'John Doe',
                      inputType: TextInputType.text,
                      onFieldSubmitted: (value) => controller.fetch(),
                      suffixIcon: IconButton(
                          onPressed: controller.fetch,
                          icon: const Icon(Icons.search)),
                      controller: controller.nameEditingController),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FormInput(
                          label: 'Limit',
                          useDecorationLabel: true,
                          hint: '0-100',
                          inputType: TextInputType.number,
                          onFieldSubmitted: (value) => controller.fetch(),
                          controller: controller.limit,
                          validator: FormBuilderValidators.numeric(),
                          suffixIcon: IconButton(
                            onPressed: () => controller.fetch,
                            icon: const Icon(Icons.filter_alt_outlined),
                          )),
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    DefaultButton(
                        onPressed: controller.clear,
                        type: Type.warning,
                        child: const Text('clear'))
                  ],
                ),
                UnconstrainedBox(
                  child: Container(
                    width: 100.w,
                    height: 1,
                    color: Colors.grey.shade200,
                    margin: const EdgeInsets.only(top: 4),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => !controller.isLoading.value
                        ? ListView.builder(
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  onTap: () => controller.showDetail(index),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  leading: Hero(
                                    tag: controller.users[index].id,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          controller.users[index].image),
                                    ),
                                  ),
                                  title: Text(controller.users[index].fullName),
                                  subtitle: Text(controller.users[index].email),
                                  trailing: Text(
                                      controller.users[index].age.toString()),
                                ),
                              );
                            },
                            itemCount: controller.users.length,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
