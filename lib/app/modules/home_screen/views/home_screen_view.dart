import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiitak_test/app/modules/home_screen/views/activity_stream_card.dart';
import 'package:jiitak_test/utils/appColors.dart';

import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'さがす',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'お仕事',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.qr_code_scanner,
                color: Colors.transparent,
              ),
              label: '打刻する',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'チャット',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'マイページ',
            ),
          ],
          currentIndex: controller.selectedIndexNavBar.value,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.all(9),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Appcolor.primaryColor, Appcolor.primaryColorLight],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.qr_code_scanner,
            size: 30,
            color: Appcolor.white,
          ),
        ),
        body: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 27),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          style: GoogleFonts.notoSansJp(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                          decoration: InputDecoration(
                            hintText: '北海道, 札幌市',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Appcolor.lightGrey,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.tune,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.favorite_outline,
                        color: Appcolor.favouriteColor,
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Appcolor.primaryColor,
                        Appcolor.primaryColorLight
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 11,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "2022年 5月 26日（木)",
                    style: GoogleFonts.notoSansJp(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(() => ListView.separated(
                    padding: EdgeInsets.only(top: 24),
                    itemBuilder: (contex, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                  7,
                                  (index) => Obx(
                                        () => GestureDetector(
                                          onTap: () {
                                            controller.selectedDate.value =
                                                index;
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 12,
                                              horizontal: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Appcolor.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "木",
                                                  style: GoogleFonts.notoSansJp(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 17,
                                                    color: controller
                                                                .selectedDate
                                                                .value ==
                                                            index
                                                        ? Appcolor.white
                                                        : null,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  "26",
                                                  style: GoogleFonts.notoSansJp(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))),
                        );
                      } else {
                        return ActivityStreamCard(
                          onTap: () {
                            controller.toggleFavourite(index - 1);
                          },
                          data: controller.activityStreamCardsData[index - 1],
                        );
                      }
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                    itemCount: controller.activityStreamCardsData.length + 1,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
