import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mi_mall/app/modules/user/controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.offAndToNamed('/login');
            },
            child: const  ListTile(
              title: Text("退出登录"),
              trailing: Icon(Icons.exit_to_app),
            )),
      ),
    );
  }
}
