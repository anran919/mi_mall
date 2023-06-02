import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mi_mall/app/models/product_model_model.dart';
import 'package:mi_mall/app/services/http_client.dart';

class ProductListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final HttpClient client = HttpClient();
  int page = 1;
  int pageSize = 8;
  String _sort = "";
  bool flag = true;
  RxInt listCount = 20.obs;
  RxList<ProductItem> productList = <ProductItem>[].obs;
  ScrollController scrollController = ScrollController();
  late AnimationController animationController;
  RxBool hasData = true.obs;
  RxInt selectedFilerIndex = 0.obs;
  RxInt filterSort = 1.obs;
  RxList filterHeaderList = [
    {
      "index": 0,
      "title": "综合",
      "filed": 'all',
      "sort": -1,
    },
    {
      "index": 1,
      "title": "销量",
      "filed": 'salecount',
      "sort": -1,
    },
    {
      "index": 2,
      "title": "价格",
      "filed": 'price',
      "sort": -1,
    },
    {
      "index": 3,
      "title": "新品优选",
      "filed": 'new',
      "sort": -1,
    },
    {
      "index": 4,
      "title": "筛选",
    }
  ].obs;
  List parameterList = [
    {
      "id": 1,
      "title": "内存容量",
      "filed": 'rom',
    },
    {
      "id": 2,
      "title": "运行内存",
      "filed": 'ram',
    },
    {
      "id": 3,
      "title": "CPU型号",
      "filed": 'cpu',
    },
    {
      "id": 4,
      "title": "网络类型",
      "filed": 'net',
    },
  ];

  String searchUrl = '';

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _getProductList();
    _addScrollController();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    animationController.dispose();
  }

  void onFilterItemClick(item) {
    int index = item['index'];
    if (item['filed'] == null) {
      _sort = '';
    } else {
      String filed = item['filed'];
      int sort = item['sort'];
      _sort = "${filed}_$sort";
      filterHeaderList[index]['sort'] = (filterHeaderList[index]['sort']) * -1;
      filterSort.value = filterHeaderList[index]['sort'];
      init();
      _getProductList();
    }
    selectedFilerIndex.value = index;
  }

  void _addScrollController() {
    // scrollController.position.pixels  滚动条下拉的高度
    // scrollController.position.maxScrollExtent  页面的高度
    scrollController.addListener(() {
      debugPrint('滚动条下拉的高度 : ${scrollController.position.pixels}');
      debugPrint('页面的高度 : ${scrollController.position.maxScrollExtent}');
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 20) {
        _getProductList();
      }
    });
  }

  init() {
    //重置page
    page = 1;
    //重置数据
    productList.value = [];
    //重置hasData
    hasData.value = true;
    scrollController.jumpTo(0);
  }

  void _getProductList() async {
    if (flag && hasData.value) {
      flag = false;
      String? keywords = Get.arguments['keywords'];
      String? cid = Get.arguments['cid'];
      if (cid != null) {
        searchUrl =
            "/api/plist?cid=$cid&page=$page&pageSize=$pageSize&sort=$_sort";
      } else {
        searchUrl =
            "/api/plist?search=$keywords&page=$page&pageSize=$pageSize&sort=$_sort";
      }
      var response = await client.get(searchUrl);
      debugPrint("url : $searchUrl ");
      if (response != null) {
        var product = ProductModel.fromJson(response.data);
        var result = product.result!;
        productList.addAll(result);
        page++;
        flag = true;
        update();
        if (result.length < pageSize) {
          hasData.value = false;
        }
      }
    }
  }
}
