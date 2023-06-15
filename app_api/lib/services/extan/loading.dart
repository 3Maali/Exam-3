import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

lodingPage({required BuildContext context}) {
  return showDialog(
      context: context,
      barrierColor: Color.fromARGB(1, 174, 174, 174),
      builder: (context) => Center(child: CircularProgressIndicator()));
}

getData({required String keyUser}) {
  final box = GetStorage();
  if (box.hasData(keyUser)) {
    return box.read(keyUser);
  } else {
    return null;
  }
}

getDataWithLoading({required BuildContext context, required String keyUser}) {
  lodingPage(context: context);
  final data = getData(keyUser: keyUser);

  if (data != null) {
    Navigator.of(context).pop();
  }
}
