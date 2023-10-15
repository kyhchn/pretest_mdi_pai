import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pretest_mdi_pai/app/data/themes/colors.dart';
import 'package:pretest_mdi_pai/app/data/themes/typography.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../controllers/user_detail_controller.dart';

class UserDetailView extends GetView<UserDetailController> {
  const UserDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          title: Text(
            'Detail User',
            style: TypographyStyles.h3.semibold(),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 1.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => Hero(
                    tag: controller.bulkUser.id,
                    child: Center(
                      child: CircleAvatar(
                        radius: 10.h,
                        backgroundImage: NetworkImage(
                            controller.user.value?.image ??
                                controller.bulkUser.image),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Skeletonizer(
                      ignoreContainers: true,
                      enabled: controller.isLoading.value,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Center(
                            child: Text(controller.user.value?.fullName ?? '',
                                style: TypographyStyles.h3.semibold()),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          section('Personal', [
                            commonTile(
                                'Nama Lengkap',
                                controller.user.value?.fullName ??
                                    controller.bulkUser.fullName),
                            commonTile(
                                'Umur',
                                controller.user.value?.age.toString() ??
                                    controller.dummyUser.age.toString()),
                            commonTile(
                                'Alamat',
                                isCentered: true,
                                controller.user.value?.address.address ??
                                    controller.dummyUser.address.address,
                                suffix: IconButton(
                                  onPressed: () => controller
                                      .openMap(CoordinateType.personal),
                                  icon: const Icon(Icons.location_pin,
                                      color: CustomColor.primary),
                                )),
                            commonTile(
                                'Jenis Kelamin',
                                controller.user.value?.gender.name ??
                                    controller.dummyUser.gender.name),
                            commonTile(
                                'Golongan Darah',
                                controller.user.value?.bloodGroup ??
                                    controller.dummyUser.bloodGroup),
                            commonTile('Tinggi',
                                '${controller.user.value?.height} CM'),
                            commonTile(
                                'Berat', '${controller.user.value?.weight} KG'),
                            commonTile(
                                'Warna Mata',
                                controller.user.value?.eyeColor.name ??
                                    controller.dummyUser.eyeColor.name),
                            commonTile(
                                'Warna Rambut',
                                controller.user.value?.hair.color.name ??
                                    controller.dummyUser.hair.color.name),
                            commonTile(
                                'Tipe Rambut',
                                controller.user.value?.hair.type.name ??
                                    controller.dummyUser.hair.type.name),
                          ]),
                          section('Bank', [
                            commonTile(
                                'Tipe Kartu',
                                controller.user.value?.bank.cardType ??
                                    controller.dummyUser.bank.cardType),
                            commonTile(
                                'Nomor Rekening',
                                controller.user.value?.bank.cardNumber ??
                                    controller.dummyUser.bank.cardNumber),
                            commonTile(
                                'IBAN',
                                controller.user.value?.bank.iban ??
                                    controller.dummyUser.bank.iban),
                            commonTile(
                                'Expired',
                                controller.user.value?.bank.cardExpire ??
                                    controller.dummyUser.bank.cardExpire),
                            commonTile(
                                'Mata Uang',
                                controller.user.value?.bank.currency ??
                                    controller.dummyUser.bank.currency),
                          ]),
                          section('Perusahaan', [
                            commonTile(
                                'Nama Perusahaan',
                                controller.user.value?.company.name ??
                                    controller.dummyUser.company.name),
                            commonTile(
                                'Alamat',
                                isCentered: true,
                                controller
                                        .user.value?.company.address.address ??
                                    controller
                                        .dummyUser.company.address.address,
                                suffix: IconButton(
                                  onPressed: () => controller
                                      .openMap(CoordinateType.company),
                                  icon: const Icon(Icons.location_pin,
                                      color: CustomColor.primary),
                                )),
                            commonTile(
                                'Departemen',
                                controller.user.value?.company.department ??
                                    controller.dummyUser.company.department),
                            commonTile(
                                'Posisi',
                                controller.user.value?.company.title ??
                                    controller.dummyUser.company.title),
                          ]),
                          section('Kontak', [
                            commonTile(
                                'Email',
                                controller.user.value?.email ??
                                    controller.dummyUser.email,
                                isCentered: true,
                                suffix: IconButton(
                                  onPressed: controller.mail,
                                  icon: const Icon(Icons.mail,
                                      color: CustomColor.primary),
                                )),
                            commonTile(
                                'No.Telepon',
                                controller.user.value?.phone ??
                                    controller.dummyUser.phone,
                                isCentered: true,
                                suffix: IconButton(
                                    onPressed: controller.call,
                                    icon: const Icon(
                                      Icons.phone,
                                      color: CustomColor.primary,
                                    ))),
                          ]),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        )));
  }

  Container section(String title, List<Widget> children) {
    children.insert(
        0,
        Text(
          title,
          style: TypographyStyles.h4.semibold(),
        ));
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 0.5.h),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(color: Colors.grey.shade300),
        bottom: BorderSide(color: Colors.grey.shade300),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Container commonTile(String title, String value,
      {Widget suffix = const SizedBox(), bool isCentered = false}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 1.h),
      child: Row(
        crossAxisAlignment:
            isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 40.w,
            child: Text(
              title,
              style: TypographyStyles.b2.semibold(color: Colors.grey.shade700),
            ),
          ),
          Expanded(
              child: Text(value,
                  style: TypographyStyles.b2
                      .copyWith(color: Colors.grey.shade700))),
          suffix
        ],
      ),
    );
  }
}
