import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mi_mall/app/modules/cart/views/cart_view.dart';
import 'package:mi_mall/app/modules/category/views/category_view.dart';
import 'package:mi_mall/app/modules/give/views/give_view.dart';
import 'package:mi_mall/app/modules/home/views/home_view.dart';
import 'package:mi_mall/app/modules/user/views/user_view.dart';
import 'package:flutter/material.dart';

class TabsController extends GetxController {
  final currentIndex = 1.obs;
  PageController pageController = PageController(initialPage: 1);
  final List<Widget> pages = const [
    HomeView(),
    CategoryView(),
    GiveView(),
    CartView(),
    UserView(),
  ];

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

  void setCurrentIndex(index) {
    currentIndex.value = index;
    update();
  }
}
