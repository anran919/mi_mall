import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:mi_mall/app/services/http_client.dart';

import '../../../models/category_model.dart';

class CategoryController extends GetxController {
  RxInt selectIndex = 0.obs;
  late RxList<CategoryItems> leftCategoryList = <CategoryItems>[].obs;
  late RxList<CategoryItems> rightCategoryList = <CategoryItems>[].obs;
  HttpClient client = HttpClient();

  @override
  void onInit() {
    super.onInit();
    getLeftCategoryData();
  }

  void changeIndex(index, id) {
    selectIndex.value = index;
    getRightCategoryData(id);
    update();
  }

  Future<void> getLeftCategoryData() async {
    var response = await client.get("/api/pcate");
    if (response != null) {
      var category = CategoryModel.fromJson(response.data);
      leftCategoryList.value = category.result!;
      getRightCategoryData(leftCategoryList[0].sId!);
      update();
    }
  }

  Future<void> getRightCategoryData(String pid) async {
    var response = await client.get("/api/pcate?pid=$pid");
    if (response != null) {
      var category = CategoryModel.fromJson(response.data);
      rightCategoryList.value = category.result!;
      update();
    }
  }
}
