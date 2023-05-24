import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/screen_adapter.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.messenger_outline,
                color: Colors.grey[500],
              )),
        ],
        title: Container(
          width: ScreenAdapter.width(900),
          height: ScreenAdapter.height(80),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: ScreenAdapter.width(15)),
                    child: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: ScreenAdapter.width(20)),
                    child: Text(
                      "搜索商品",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(35),
                          color: Colors.grey[500]),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: Row(
        children: [
          SizedBox(
            width: ScreenAdapter.width(300),
            height: double.infinity,
            child: Obx(() => ListView.builder(
                itemCount: controller.leftCategoryList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    height: ScreenAdapter.height(180),
                    child: InkWell(
                      onTap: () {
                        controller.changeIndex(
                            index, controller.leftCategoryList[index].sId);
                      },
                      child: Obx(()=>Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: ScreenAdapter.width(10),
                              height: ScreenAdapter.height(46),
                              color: controller.selectIndex.value == index
                                  ? Colors.red
                                  : Colors.white,
                            ),
                          ),
                          Center(
                            child: Text(
                              "${controller.leftCategoryList[index].title}",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(36),
                                  fontWeight:
                                  controller.selectIndex.value == index
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          )
                        ],
                      )),
                    ),
                  );
                })),
          ),
          Expanded(
              child: Obx(() => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: ScreenAdapter.width(10),
                      mainAxisSpacing: ScreenAdapter.width(10),
                      childAspectRatio: 210 / 320,
                      crossAxisCount: 3),
                  itemCount: controller.rightCategoryList.length,
                  itemBuilder: (context, index) {
                    String picUrl =
                        "https://xiaomi.itying.com/${controller.rightCategoryList[index].pic}";
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Image.network(picUrl.replaceAll("\\", "/"),
                              fit: BoxFit.fitHeight),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, ScreenAdapter.height(10), 0, 0),
                          child: Text("手机",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(34))),
                        )
                      ],
                    );
                  })))
        ],
      ),
    );
  }
}
