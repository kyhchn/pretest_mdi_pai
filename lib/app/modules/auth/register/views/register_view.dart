import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:pretest_mdi_pai/app/data/constants/utils.dart';
import 'package:pretest_mdi_pai/app/data/themes/typography.dart';
import 'package:pretest_mdi_pai/app/widgets/button.dart';
import 'package:pretest_mdi_pai/app/widgets/form_input.dart';
import 'package:sizer/sizer.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: SingleChildScrollView(
          child: Form(
            key: controller.key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/login.jpg',
                    height: 30.h,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Daftar Akun',
                      style: TypographyStyles.h2
                          .copyWith(color: Colors.grey.shade900),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                        'Buat akun baru untuk bergabung dan apalah copywritingnya wkwk bersama kami',
                        style: TypographyStyles.b2
                            .copyWith(color: Colors.grey.shade600)),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                FormInput(
                    validator: FormBuilderValidators.email(),
                    label: 'Alamat Email',
                    hint: 'Masukkan alamat email',
                    inputType: TextInputType.emailAddress,
                    controller: controller.emailController),
                SizedBox(
                  height: 1.5.h,
                ),
                FormInput(
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                      FormBuilderValidators.match(Utils.passwordRegex)
                    ]),
                    label: 'Kata Sandi',
                    hint: '****',
                    inputType: TextInputType.visiblePassword,
                    controller: controller.passwordController),
                SizedBox(
                  height: 1.5.h,
                ),
                FormInput(
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                      FormBuilderValidators.match(Utils.passwordRegex)
                    ]),
                    label: 'Konfirmasi Kata Sandi',
                    hint: '****',
                    inputType: TextInputType.visiblePassword,
                    controller: controller.passwordConfirmController),
                SizedBox(
                  height: 1.5.h,
                ),
                SizedBox(
                    width: double.infinity,
                    child: Obx(
                      () => DefaultButton(
                        onPressed: controller.register,
                        type: Type.primary,
                        child: controller.isLoading.value
                            ? SizedBox(
                                width: 2.h,
                                height: 2.h,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Daftar'),
                      ),
                    )),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Sudah punya akun? Silahkan',
                      style: TypographyStyles.b3,
                    ),
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text('Masuk'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
