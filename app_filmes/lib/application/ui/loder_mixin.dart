import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

mixin LoderMixin on GetxController {
  void loaderListerner(RxBool loadind) {
    ever<bool>(loadind, (loadingCallback) async {
      if (loadingCallback) {
        await Get.dialog(
          const Center(
            child: CircularProgressIndicator(),
          ),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }
}
