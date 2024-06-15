import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiitak_test/utils/appColors.dart';
import 'package:jiitak_test/utils/dropdown.dart';
import 'package:jiitak_test/utils/image_picker.dart';
import 'package:jiitak_test/utils/multiple_check_box.dart';
import 'package:jiitak_test/utils/time_picker.dart';

import '../controllers/edit_store_info_controller.dart';

class EditStoreInfoView extends GetView<EditStoreInfoController> {
  const EditStoreInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.white,
      appBar: AppBar(
        backgroundColor: Appcolor.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Appcolor.lightGrey8C.withOpacity(0.1),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.chevron_left,
                color: Color(0xffB8B8B8),
              ),
            ),
            onTap: () {
              Get.back();
            },
          ),
        ),
        title: Text(
          '店舗プロフィール編集',
          style: GoogleFonts.notoSansJp(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Appcolor.black4B,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  color: Appcolor.black4B,
                  size: 32,
                ),
                Positioned(
                  right: -5,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Appcolor.primaryColor,
                    ),
                    child: Text(
                      "99+",
                      style: GoogleFonts.notoSansJp(
                        fontWeight: FontWeight.w500,
                        fontSize: 8,
                        color: Appcolor.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            height: 1,
            thickness: 0,
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextFieldWithTitle(
                        title: '店舗名',
                      ),
                      const TextFieldWithTitle(
                        title: '代表担当者名',
                      ),
                      const TextFieldWithTitle(
                        title: '店舗電話番号',
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                      const TextFieldWithTitle(
                        title: '店舗住所',
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width * 0.7,
                        color: Appcolor.primaryColorLight,
                        //TODO:Add Api key
                        //  GoogleMap(
                        //     initialCameraPosition:
                        //         CameraPosition(target: LatLng(27, 85))),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ImageUploader(
                        title: "店舗外観",
                        subtitle: "最大3枚まで",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ImageUploader(
                        title: "店舗内観",
                        subtitle: "1枚〜3枚ずつ追加してください",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ImageUploader(
                        title: "店舗内観",
                        subtitle: "1枚〜3枚ずつ追加してください",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ImageUploader(
                        title: "メニュー写真",
                        subtitle: "1枚〜3枚ずつ追加してください",
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const RequiredTextWidget(
                        title: "営業時間",
                      ),
                      TimePickerWidget(),
                      const SizedBox(
                        height: 16,
                      ),
                      const RequiredTextWidget(
                        title: "ランチ時間",
                      ),
                      TimePickerWidget(),
                      const SizedBox(
                        height: 16,
                      ),
                      const RequiredTextWidget(
                        title: "定休日",
                      ),
                      DaySelectionWidget(),
                      const RequiredTextWidget(
                        title: "料理カテゴリ",
                      ),
                      CustomDropdown(),
                      const SizedBox(
                        height: 16,
                      ),
                      const RequiredTextWidget(
                        title: "予算",
                      ),
                      const Row(
                        children: [
                          Expanded(child: CustomTextField()),
                          Text(
                            ' ~ ',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Expanded(child: CustomTextField()),
                        ],
                      ),
                      const TextFieldWithTitle(
                        title: 'キャッチコピー',
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                      const TextFieldWithTitle(
                        title: '座席数',
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            vertical: 13,
                          ),
                          decoration: BoxDecoration(
                              color: Appcolor.primaryColorLight,
                              borderRadius: BorderRadius.circular(4),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffEE7D42),
                                  Color(0xffFFC8AB),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 15,
                                  spreadRadius: 0,
                                  color: const Color(
                                    0xffEE7D42,
                                  ).withOpacity(0.25),
                                ),
                              ]),
                          alignment: Alignment.center,
                          child: Text(
                            "編集を保存",
                            style: GoogleFonts.notoSansJp(
                              color: Appcolor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle(
      {super.key,
      this.controller,
      required this.title,
      this.isRequired = true,
      this.keyboardType});
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String title;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RequiredTextWidget(title: title, isRequired: isRequired),
        const SizedBox(
          height: 4,
        ),
        CustomTextField(
            controller: controller,
            keyboardType: keyboardType,
            isRequired: isRequired),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.isRequired = false,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: isRequired
          ? (value) {
              if (value!.isEmpty) {
                return "This field cannot be empty!";
              }
              return null;
            }
          : null,
      style: GoogleFonts.notoSansJp(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Appcolor.black45,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 7,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Appcolor.listDateColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Appcolor.listDateColor,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Appcolor.astrickCOlor,
            )),
      ),
    );
  }
}

class RequiredTextWidget extends StatelessWidget {
  const RequiredTextWidget({
    super.key,
    required this.title,
    this.isRequired = true,
  });

  final String title;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: GoogleFonts.notoSansJp(
              color: Appcolor.black4B,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (isRequired)
            TextSpan(
              text: '*',
              style: GoogleFonts.notoSansJp(
                color: Appcolor.astrickCOlor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
