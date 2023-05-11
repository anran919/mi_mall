import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_mall/app/services/keep_alive.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategoryView'),
        centerTitle: true,
      ),
      body:  Center(
        child: KeepAliveWrapper(
          child: ListView(
            children: const [
              ListTile(title: Text('title111'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title222'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title333'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title'),),
              ListTile(title: Text('title444'),),
            ],
          ),
        ),
      ),
    );
  }
}
