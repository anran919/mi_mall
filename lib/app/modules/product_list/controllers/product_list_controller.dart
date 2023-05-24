import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mi_mall/app/models/product_model_model.dart';
import 'package:mi_mall/app/services/http_client.dart';

class ProductListController extends GetxController {
  final HttpClient client = HttpClient();
  int page = 1;
  int pageSize = 8;
  RxInt listCount = 20.obs;
  RxList<ProductItem> productList  = <ProductItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getProductList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _getProductList() async {
    String url =
        "/api/plist?cid=${Get.arguments["cid"]}&page=$page&pageSize=$pageSize";
    var response = await client.get(url);
    if (response != null) {
      var product = ProductModel.fromJson(response.data);
      productList.value = product.result!;
      update();
    }
  }
}
