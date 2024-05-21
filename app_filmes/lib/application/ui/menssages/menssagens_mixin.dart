import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MenssagensMixin on GetxController {
  void menssagenListiner(Rx<MessageModel?> message) {
    ever<MessageModel?>(message, (model) {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.type.color(),
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final Messagetype type;
  MessageModel.error({
    required this.title,
    required this.message,
  }) : type = Messagetype.error;

  MessageModel.info({
    required this.title,
    required this.message,
  }) : type = Messagetype.info;
}

enum Messagetype { error, info }

extension MessagetypeExtension on Messagetype {
  Color color() {
    switch (this) {
      case Messagetype.error:
        return Colors.red[600] ?? Colors.red;
      case Messagetype.info:
        return Colors.blue[200] ?? Colors.blue;
    }
  }
}
