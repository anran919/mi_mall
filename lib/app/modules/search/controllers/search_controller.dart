import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mi_mall/app/services/search_service.dart';

class SearchController extends GetxController {
  RxList historyList = [
    // "XBox",
    // "Macbook pro 2021 16G",
    // "Macbook",
    // "iPhone 14 ",
    // "Macbook pro 2022",
  ].obs;

  RxList likeList = [
    "PS4",
    "Macbook mini",
    "iPhone 14 ",
    "iPad pro 2022",
    "iPhone 14 ",
    "Macbook pro 2022"
  ].obs;
  RxString keywords = "".obs;
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      keywords.value = searchController.text;
    });
    getHistoryList();
  }

  getHistoryList() async {
    var data = await SearchService.getHistory(SearchService.SEARCH_HISTORY);
    if (data.isNotEmpty) {
      historyList.addAll(data);
      update();
    }
  }

  clearHistory() async {
    await SearchService.clear();
    historyList.clear();
    update();
  }

  removeByName(element) async {
    await SearchService.remove(element);
    historyList.remove(element);
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
