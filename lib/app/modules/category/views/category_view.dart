import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_mall/app/services/keep_alive.dart';
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
      body: Center(
        child: KeepAliveWrapper(
          child: ListView(
            children: const  [
              ListTile(
                title: Text('title111'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title222'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title333'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title'),
              ),
              ListTile(
                title: Text('title444'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
