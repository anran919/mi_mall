import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.pageController,
            children: controller.pages,
            onPageChanged: (index) {
              controller.setCurrentIndex(index);
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            // 超过三个item需要设置  type: BottomNavigationBarType.fixed,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 10,
            selectedFontSize: 14,
            iconSize: 26,
            selectedItemColor: Colors.orange,
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.setCurrentIndex(index);
              controller.pageController.jumpToPage(index);
            },
            items: const [
              BottomNavigationBarItem(
                  label: "首页", icon: Icon(Icons.home_outlined)),
              BottomNavigationBarItem(
                  label: "分类", icon: Icon(Icons.category_sharp)),
              BottomNavigationBarItem(
                  label: "服务", icon: Icon(Icons.favorite_border_outlined)),
              BottomNavigationBarItem(
                  label: "购物车", icon: Icon(Icons.shopping_cart_outlined)),
              BottomNavigationBarItem(
                label: "我的",
                icon: Badge(
                  label: Text('12'),
                  child: Icon(Icons.person_outline),
                ),
              ),
            ],
          ),
        ));
  }
}
