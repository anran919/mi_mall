import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/screen_adapter.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        title: Container(
          width: ScreenAdapter.width(900),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(246, 246, 246, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: CupertinoTextField(
            style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
            autofocus: true,
            prefix: const Padding(
              padding: EdgeInsets.only(left: 8, right: 5),
              child: Icon(Icons.search),
            ),
            placeholder: "手机",
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Theme.of(context).primaryColor,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "搜索",
                style: TextStyle(fontSize: ScreenAdapter.fontSize(38)),
              ))
        ],
        elevation: 0,
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('搜索历史'),
            trailing: Icon(Icons.delete_outline),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: controller.historyList
                .map((element) => Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(element),
                    ))
                .toList(),
          ),
          const ListTile(
            title: Text('猜你想搜'),
            trailing: Icon(Icons.refresh),
          ),
          Wrap(
            spacing: 3,
            runSpacing: 6,
            children: controller.likeList
                .map((element) => Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(element),
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(padding: const EdgeInsets.all(10),child: Card(
            elevation: 10.0,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromRGBO(253, 240, 232, 1.0),
                            Colors.white
                          ])),
                  child: ListTile(
                    title: Text(
                      "小米热搜",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(50),
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(
                      Icons.hotel_class_rounded,
                      color: Colors.deepOrange,
                      size: ScreenAdapter.fontSize(80),
                    ),
                  ),
                ),
                GridView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 4 / 2, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Image.asset(
                                  'assets/images/sx2.webp',
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 3,
                                child: Text(
                                  'CPU、屏幕等体验的核心硬件',
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(32)),
                                ))
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),)
        ],
      ),
    );
  }
}
