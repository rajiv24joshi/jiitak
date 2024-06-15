import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiitak_test/utils/appColors.dart';

import '../controllers/stamp_detail_controller.dart';

class StampDetailView extends GetView<StampDetailController> {
  const StampDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.stampDetailsScaffoldColor,
      appBar: AppBar(
        backgroundColor: Appcolor.stampDetailsScaffoldColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Appcolor.backButtonBackgroundColor),
              alignment: Alignment.center,
              child: const Icon(
                Icons.chevron_left,
                color: Appcolor.white,
              ),
            ),
            onTap: () {
              Get.back();
            },
          ),
        ),
        title: Text(
          'スタンプカード詳細',
          style: GoogleFonts.notoSansJp(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Appcolor.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle more options action
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Appcolor.stampDetailsScaffoldColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mer キッチン',
                  style: GoogleFonts.notoSansJp(
                    color: Appcolor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '現在の獲得数 ',
                        style: GoogleFonts.notoSansJp(
                          color: Appcolor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '30',
                        style: GoogleFonts.notoSansJp(
                          color: Appcolor.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '個',
                        style: GoogleFonts.notoSansJp(
                          color: Appcolor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Appcolor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    22,
                  ),
                  topRight: Radius.circular(
                    22,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SliderWidget(),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'スタンプ獲得履歴',
                      style: GoogleFonts.notoSansJp(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  '2021 / 11 / ${18 - index}',
                                  style: GoogleFonts.notoSansJp(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Appcolor.listDateColor,
                                  ),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'スタンプを獲得しました。',
                                      style: GoogleFonts.notoSansJp(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Appcolor.black45,
                                      ),
                                    ),
                                    Text(
                                      '1個',
                                      style: GoogleFonts.notoSansJp(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Appcolor.black45,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      decoration: BoxDecoration(
                        color: Appcolor.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Appcolor.black.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 15,
                            offset: const Offset(
                              0,
                              4,
                            ),
                          ),
                        ],
                      ),
                      child: Container(
                        color: Appcolor.white,
                        width: MediaQuery.of(context).size.width -
                            ((16 * 3) + 25 + 25),
                        child: GridView.count(
                          padding: EdgeInsets.zero,
                          crossAxisCount: 5,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 15,
                          children: List.generate(15, (index) {
                            return Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFFFE0B2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  color: Colors.orange,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                  itemCount: 2)),
          // const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '2 / 2 枚目',
              style: GoogleFonts.notoSansJp(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
