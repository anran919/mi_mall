import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:mi_mall/app/modules/category_model.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RxBool flag = false.obs;
  late RxList swiperItems = [].obs;
  late RxList<CategoryItems> categoryItems = <CategoryItems>[].obs;

  @override
  void onInit() {
    super.onInit();
    initData();
    initListener();
  }

  initData() {
    getFocusItems();
    getCategoryItems();
  }

  initListener() {
    scrollController.addListener(() {
      double height = scrollController.position.pixels;
      if (height > 10 && height < 30 && flag.value == false) {
        flag.value = true;
        update();
      }
      if (height < 10 && flag.value == true) {
        flag.value = false;
        update();
      }
    });
  }

  getFocusItems() async {
    var response = await Dio().get("https://xiaomi.itying.com/api/focus");
    swiperItems.value = response.data['result'];
    update();
  }

  getCategoryItems() async {
    var response = await Dio().get('https://xiaomi.itying.com/api/bestCate');
    var category = CategoryModel.fromJson(response.data);
    categoryItems.value = category.result!;
    update();
  }
}
