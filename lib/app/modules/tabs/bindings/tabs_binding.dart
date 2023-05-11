import 'package:get/get.dart';
import 'package:mi_mall/app/modules/cart/controllers/cart_controller.dart';
import 'package:mi_mall/app/modules/category/controllers/category_controller.dart';
import 'package:mi_mall/app/modules/give/controllers/give_controller.dart';
import 'package:mi_mall/app/modules/home/controllers/home_controller.dart';
import 'package:mi_mall/app/modules/user/controllers/user_controller.dart';

import '../controllers/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    Get.lazyPut<GiveController>(
      () => GiveController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
    Get.lazyPut<UserController>(
      () => UserController(),
    );
  }
}
