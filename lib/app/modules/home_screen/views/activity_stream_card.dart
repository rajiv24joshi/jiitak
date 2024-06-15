import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiitak_test/test_images.dart';
import 'package:jiitak_test/utils/appColors.dart';

const Color activityStreamCardShadow = Color(0xff88A0BB);

class ActivityStreamCardDataModel {
  final String imageURL;
  final String careServiceType;
  final String applicationTitle;
  final String yen;
  final String dateTime;
  final String address;
  final String transportationExpenses;
  final String careProviderName;
  final String daysLeftCount;
  final bool isFavourite;

  const ActivityStreamCardDataModel({
    required this.isFavourite,
    required this.imageURL,
    required this.careServiceType,
    required this.applicationTitle,
    required this.yen,
    required this.dateTime,
    required this.address,
    required this.transportationExpenses,
    required this.careProviderName,
    required this.daysLeftCount,
  });

  ActivityStreamCardDataModel copyWith({
    bool? isFavourite,
    String? imageURL,
    String? careServiceType,
    String? applicationTitle,
    String? yen,
    String? dateTime,
    String? address,
    String? transportationExpenses,
    String? careProviderName,
    String? daysLeftCount,
  }) {
    return ActivityStreamCardDataModel(
      isFavourite: isFavourite ?? this.isFavourite,
      imageURL: imageURL ?? this.imageURL,
      careServiceType: careServiceType ?? this.careServiceType,
      applicationTitle: applicationTitle ?? this.applicationTitle,
      yen: yen ?? this.yen,
      dateTime: dateTime ?? this.dateTime,
      address: address ?? this.address,
      transportationExpenses:
          transportationExpenses ?? this.transportationExpenses,
      careProviderName: careProviderName ?? this.careProviderName,
      daysLeftCount: daysLeftCount ?? this.daysLeftCount,
    );
  }
}

class ActivityStreamCard extends StatelessWidget {
  final ActivityStreamCardDataModel data;
  final Function onTap;

  const ActivityStreamCard(
      {super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 25,
            spreadRadius: 0,
            color: activityStreamCardShadow.withOpacity(.15),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                height: 186,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image: AssetImage(data.imageURL),
                        fit: BoxFit
                            .cover, // You can change this property to adjust the image fit
                      )),
                ),
              ),
              Positioned(
                left: -10,
                bottom: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                      color: Appcolor.reddishColor,
                      borderRadius: BorderRadius.circular(2.5)),
                  child: Text(
                    "本日まで",
                    style: GoogleFonts.notoSansJp(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Appcolor.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.applicationTitle),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    careServiceTypeWidget(data.careServiceType),
                    yenTextWidget(data.yen)
                  ],
                ),
                const SizedBox(
                  height: 11,
                ),
                textWidget(data.dateTime),
                textWidget(data.address),
                textWidget(data.transportationExpenses),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    careProviderTextWidget(data.careProviderName),
                    GestureDetector(
                      onTap: () {
                        onTap();
                      },
                      child: Icon(
                        data.isFavourite
                            ? Icons.favorite_outlined
                            : Icons.favorite_outline,
                        color: data.isFavourite
                            ? Appcolor.favouriteColor
                            : Appcolor.favouriteDisableColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget careServiceTypeWidget(String careType) => Container(
        color: Appcolor.primaryColor.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7),
          child:
              Text(careType, style: const TextStyle(color: Color(0xffEEAB40))),
        ),
      );

  Widget applicationTitleWidget(String applicationTitle) => Text(
        applicationTitle,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      );

  Widget textWidget(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      );

  Widget yenTextWidget(String yen) => Text(
        yen,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      );

  Widget careProviderTextWidget(String text) => Text(
        text,
        style: TextStyle(color: Appcolor.subTextColor),
      );
}
