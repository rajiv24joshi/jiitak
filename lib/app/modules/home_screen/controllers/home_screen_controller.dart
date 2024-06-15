import 'package:get/get.dart';
import 'package:jiitak_test/app/modules/home_screen/views/activity_stream_card.dart';
import 'package:jiitak_test/test_images.dart';

class HomeScreenController extends GetxController {
  //TODO: Implement HomeScreenController

  final selectedDate = 0.obs;
  final selectedIndexNavBar = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  RxList<ActivityStreamCardDataModel> activityStreamCardsData = [
    const ActivityStreamCardDataModel(
        imageURL: TestImages.homePageImage1,
        careServiceType: 'イエローテキスト1',
        applicationTitle: 'アプリケーションタイトル1',
        yen: '¥ 6,000',
        dateTime: '5月 31日（水）08 : 00 ~ 17 : 00',
        address: '北海道札幌市東雲町3丁目916番地17号',
        transportationExpenses: '交通費 300円',
        careProviderName: 'ケアプロバイダー名1',
        daysLeftCount: '5',
        isFavourite: true),
    const ActivityStreamCardDataModel(
        imageURL: TestImages.homePageImage1,
        careServiceType: 'イエローテキスト2',
        applicationTitle: 'アプリケーションタイトル2',
        yen: '200',
        dateTime: '2024年06月15日',
        address: '住所2',
        transportationExpenses: '交通費2',
        careProviderName: 'ケアプロバイダー名2',
        daysLeftCount: '4',
        isFavourite: false),
    const ActivityStreamCardDataModel(
        imageURL: TestImages.homePageImage1,
        careServiceType: 'イエローテキスト3',
        applicationTitle: 'アプリケーションタイトル3',
        yen: '300',
        dateTime: '2024年06月16日',
        address: '住所3',
        transportationExpenses: '交通費3',
        careProviderName: 'ケアプロバイダー名3',
        daysLeftCount: '3',
        isFavourite: false),
    const ActivityStreamCardDataModel(
        imageURL: TestImages.homePageImage1,
        careServiceType: 'イエローテキスト4',
        applicationTitle: 'アプリケーションタイトル4',
        yen: '400',
        dateTime: '2024年06月17日',
        address: '住所4',
        transportationExpenses: '交通費4',
        careProviderName: 'ケアプロバイダー名4',
        daysLeftCount: '2',
        isFavourite: false),
    const ActivityStreamCardDataModel(
        imageURL: TestImages.homePageImage1,
        careServiceType: 'イエローテキスト5',
        applicationTitle: 'アプリケーションタイトル5',
        yen: '500',
        dateTime: '2024年06月18日',
        address: '住所5',
        transportationExpenses: '交通費5',
        careProviderName: 'ケアプロバイダー名5',
        daysLeftCount: '1',
        isFavourite: false),
  ].obs;

  toggleFavourite(int index) {
    activityStreamCardsData[index] = activityStreamCardsData[index]
        .copyWith(isFavourite: !activityStreamCardsData[index].isFavourite);
    activityStreamCardsData.refresh();
  }
}
