
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mi_mall/app/modules/home/widget/sx_discount.dart';
import 'package:mi_mall/app/services/screen_adapter.dart';

import '../controllers/home_controller.dart';

class RecommendView extends GetView<HomeController> {
  const RecommendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      padding: EdgeInsets.all(ScreenAdapter.width(30)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "省心优惠",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(46),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "全部优惠 >",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(36), color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: ScreenAdapter.height(30),
          ),
          const SxDiscount(),
          SizedBox(height: ScreenAdapter.height(30),),
          Container(
            height: ScreenAdapter.height(400),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenAdapter.width(10)),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/banner_1.png'))),
          ),
          SizedBox(
            height: ScreenAdapter.height(40),
          ),
          MasonryGridView.count(
            itemCount: controller.bestList.length,
            crossAxisCount: 2,
            mainAxisSpacing: ScreenAdapter.width(20),
            crossAxisSpacing: ScreenAdapter.height(20),
            shrinkWrap: true,
            //收缩, 让子元素宽度自适应宽度
            physics: const NeverScrollableScrollPhysics(),
            // 设置不滑动,因为外层有ListView
            itemBuilder: (context, index) {
              var picUrl =
                  "https://xiaomi.itying.com/${controller.bestList[index].sPic}";
              return SizedBox(
                // height: ScreenAdapter.height(700),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: CupertinoColors.lightBackgroundGray),
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenAdapter.width(10)))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image.asset(
                      //   'assets/images/focus02.png',
                      //   fit: BoxFit.cover,
                      // ),
                      Image.network(picUrl.replaceAll('\\', '/'),fit: BoxFit.fitWidth,),
                      Padding(
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.bestList[index].title}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: ScreenAdapter.height(10),
                            ),
                            Text(
                              "口碑真旗舰",
                              style: TextStyle(color: Colors.grey[500]),
                            ),
                            SizedBox(
                              height: ScreenAdapter.height(20),
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                    border: Border.all(
                                        color: CupertinoColors.activeOrange),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      "6年免息",
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(30),
                                          color: CupertinoColors.activeOrange),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                    border: Border.all(
                                        color: CupertinoColors.activeOrange),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      "加价购",
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(30),
                                          color: CupertinoColors.activeOrange),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenAdapter.height(20),
                            ),
                            Text(
                              "¥ ${controller.bestList[index].price}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          const  SizedBox(
            height: 300,
          )
        ],
      ),
    ));
  }
}
