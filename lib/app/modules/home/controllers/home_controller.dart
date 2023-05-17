import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:mi_mall/app/models/category_model.dart';
import 'package:mi_mall/app/models/product_model_model.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RxBool flag = false.obs;
  late RxList swiperItems = [].obs;
  late RxList<CategoryItems> categoryItems = <CategoryItems>[].obs;
  late RxList<ProductItem> hotList = <ProductItem>[].obs;
  late RxList<ProductItem> bestList = <ProductItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    initData();
    initListener();
  }

  initData() {
    print('initData----');
    getFocusItems();
    getCategoryItems();
    getHotList();
    getBestList();
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

  //热销臻选
  getHotList() async {
    var response = await Dio()
        .get("https://xiaomi.itying.com/api/plist?is_hot=1&pageSize=3");
    var product = ProductModel.fromJson(response.data);
    hotList.value = product.result!;
    update();
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
  getBestList() async{
    var response = await Dio()
        .get("https://xiaomi.itying.com/api/plist?is_best=1");
    var product = ProductModel.fromJson(response.data);
    bestList.value = product.result!;
    update();
  }
}
