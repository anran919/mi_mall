import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../models/category_model.dart';

class CategoryController extends GetxController {
  RxInt selectIndex = 0.obs;
  late RxList<CategoryItems> leftCategoryList = <CategoryItems>[].obs;
  late RxList<CategoryItems> rightCategoryList = <CategoryItems>[].obs;

  @override
  void onInit() {
    super.onInit();
    getLeftCategoryData();
  }

  void changeIndex(index, id) {
    selectIndex.value=index;
    getRightCategoryData(id);
    update();
  }

  Future<void> getLeftCategoryData() async {
    var response = await Dio().get("https://xiaomi.itying.com/api/pcate");
    var category = CategoryModel.fromJson(response.data);
    leftCategoryList.value = category.result!;
    getRightCategoryData(leftCategoryList[0].sId!);
    update();
  }

  Future<void> getRightCategoryData(String pid) async {
    var response =
        await Dio().get("https://xiaomi.itying.com/api/pcate?pid=$pid");
    var category = CategoryModel.fromJson(response.data);
    rightCategoryList.value = category.result!;
    update();
  }
}
