import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/screen_adapter.dart';
import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController> {
  final double headerHeight = ScreenAdapter.height(240);

  ProductListView({Key? key}) : super(key: key);

  Widget _productList(context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.only(top: headerHeight),
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.greenAccent,
                      Colors.blue,
                      Colors.orangeAccent
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Image.asset('assets/images/sx1.webp'),
                      )),
                  Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Redmi 10A',
                              style: textTheme.bodyLarge,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: ScreenAdapter.height(10),
                            ),
                            Text(
                              '6.53大尺寸屏幕 | 1300万超清主摄 | 双卡双5G | 5300万毫安大电池 | 33W有线快充',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodySmall,
                            ),
                            SizedBox(
                              height: ScreenAdapter.height(10),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Text(
                                          "CPU",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Text(
                                          "骁龙870",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Text(
                                          "CPU",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Text(
                                          "骁龙870",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Text(
                                          "CPU",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Text(
                                          "骁龙870",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: ScreenAdapter.height(10),
                            ),
                            Text(
                              '¥1199',
                              style: textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height: ScreenAdapter.height(10),
                            ),
                            Row(
                              children: [
                                Text(
                                  '72333条评价',
                                  style: textTheme.bodySmall,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '99.9%满意',
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            );
          }),
    );
  }

  Widget _filterHeader(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Positioned(
        top: 0,
        right: 0,
        left: 0,
        child: Container(
          height: headerHeight,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(ScreenAdapter.height(10)),
                      child: Text(
                        "综合",
                        style: TextStyle(
                            color: Colors.orange,
                            fontStyle: textTheme.titleSmall?.fontStyle),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(ScreenAdapter.height(10)),
                      child: Text(
                        "销量",
                        style: textTheme.titleSmall,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(ScreenAdapter.height(10)),
                      child: Text(
                        "价格",
                        style: textTheme.titleSmall,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(ScreenAdapter.height(10)),
                      child: Text(
                        "新品优选",
                        style: textTheme.titleSmall,
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(ScreenAdapter.height(10)),
                      child: Text(
                        "筛选",
                        style: textTheme.titleSmall,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenAdapter.height(40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text("内存容量", style: textTheme.bodySmall),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text("运行内存", style: textTheme.bodySmall),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text("CPU型号", style: textTheme.bodySmall),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text("网络类型", style: textTheme.bodySmall),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        title: Container(
          width: ScreenAdapter.width(900),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                child: const Icon(Icons.search),
              ),
              Text("手机",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: ScreenAdapter.fontSize(32)))
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [_productList(context), _filterHeader(context)],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.hourglass_top_rounded,
          ),
          onPressed: () {}),
    );
  }
}
