import 'package:get/get.dart';

import '../category_model.dart';

class CategoryProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return CategoryModel.fromJson(map);
      if (map is List) {
        return map.map((item) => CategoryModel.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<CategoryModel?> getCategory(int id) async {
    final response = await get('category/$id');
    return response.body;
  }

  Future<Response<CategoryModel>> postCategory(CategoryModel category) async =>
      await post('category', category);
  Future<Response> deleteCategory(int id) async => await delete('category/$id');
}
