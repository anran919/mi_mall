import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  // 配置透明状态栏
  SystemUiOverlayStyle style = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(style);
  runApp(ScreenUtilInit(
    // 配置设计稿的宽度和高度
    designSize: const Size(1080, 2400),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return GetMaterialApp(
        color: Colors.orange,
        debugShowCheckedModeBanner: true,
        title: "MI MALL",
        theme: ThemeData(primaryColor: Colors.orange),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    },
  ));
}
