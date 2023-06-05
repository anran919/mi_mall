import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_mall/app/services/http_client.dart';
import '../../../models/product_model_model.dart';
import '../../../services/screen_adapter.dart';
import '../controllers/product_list_controller.dart';

class ProductListView extends GetView<ProductListController>{
  final double headerHeight = ScreenAdapter.height(340);

  ProductListView({Key? key}) : super(key: key);

  Widget _progressIndicator() {
    return controller.hasData.value
        ? const Center(
      child: CircularProgressIndicator(
        color: Colors.orange,
      ),
    )
        : const Center(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Text('无更多数据!'),
      ),
    );
  }

  Widget _productList(context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    return Padding(
      padding: EdgeInsets.only(top: headerHeight),
      child: Obx(() =>
      controller.productList.isNotEmpty
          ? ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.productList.length,
          padding:
          const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
          itemBuilder: (context, index) {
            ProductItem item = controller.productList[index];
            return Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Image.network(
                              HttpClient.replacePath(item.sPic),
                              fit: BoxFit.cover,
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                item.title!,
                                style: textTheme.bodyLarge,
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: ScreenAdapter.height(10),
                              ),
                              Text(
                                item.subTitle!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodySmall,
                              ),
                              SizedBox(
                                height: ScreenAdapter.height(10),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "CPU",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        "骁龙870",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 40,
                                    width: 2,
                                    color: Colors.white24,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "高清拍摄",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        "4800万像素",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 40,
                                    width: 2,
                                    color: Colors.white24,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "超大屏",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      Text(
                                        "6.7寸",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: ScreenAdapter.height(10),
                              ),
                              Text(
                                "¥${item.price}",
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
                          ))
                    ],
                  ),
                ),
                index == controller.productList.length - 1
                    ? _progressIndicator()
                    : const Text('')
              ],
            );
          })
          : _progressIndicator()),
    );
  }

  Widget _arrowIcon(element) {
    int index = element['index'];
    if (index != 4) {
      return Visibility(
          visible: controller.selectedFilerIndex.value == index,
          child: controller.filterSort.value > 0
              ? Icon(
            Icons.arrow_downward,
            color: Colors.orange,
            size: ScreenAdapter.fontSize(50),
          )
              : Icon(
            Icons.arrow_upward,
            color: Colors.orange,
            size: ScreenAdapter.fontSize(50),
          ));
    } else {
      return const Text('');
    }
  }

  Widget _filterHeader(BuildContext context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          height: headerHeight,
          width: ScreenAdapter.width(1080),
          color: Colors.white,
          child: Obx(() =>
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: controller.filterHeaderList
                        .map((element) =>
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              controller.onFilterItemClick(element);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  element['title'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: controller.selectedFilerIndex
                                          .value ==
                                          element['index']
                                          ? Colors.orange
                                          : Colors.grey,
                                      fontSize: ScreenAdapter.fontSize(38),
                                      fontStyle:
                                      textTheme.titleSmall?.fontStyle),
                                ),
                                _arrowIcon(element),
                              ],
                            ),
                          ),
                        ))
                        .toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.parameterList
                        .map((element) =>
                        Expanded(
                            flex: 1,
                            child: FilterChip(
                                label: Text(element['title']),
                                selected: false,
                                onSelected: (seleted) {})))
                        .toList(),
                  )
                ],
              )),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 245, 245, 1),
      appBar: AppBar(
        title: Container(
          width: ScreenAdapter.width(900),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(230, 235, 235, 1.0),
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
        foregroundColor: Theme
            .of(context)
            .primaryColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          _productList(context),
          _filterHeader(context),
        ],
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
