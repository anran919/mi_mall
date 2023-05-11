import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static height(double value) {
    return value.h;
  }

  static width(double value) {
    return value.w;
  }

  static radius(double value) {
    return value.r;
  }

  static fontSize(int value) {
    return value.sp;
  }

  static screenWidth() {
    return 1.sw;
  }

  static screenHeight() {
    return 1.sh;
  }
}
