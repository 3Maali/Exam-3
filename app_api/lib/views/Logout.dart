import 'package:app_api/services/extan/navigitor/pushEXT.dart';
import 'package:app_api/views/Login_screen.dart';
import 'package:app_api/views/loding_screen.dart';
import 'package:app_api/views/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LogoutScreen extends StatefulWidget {
  LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white30,
            foregroundColor: Colors.white,
            elevation: 10,
            toolbarHeight: 50,
            centerTitle: true,
            title: const Text(
              "Log out",
              style: fontAppBar,
            )),
        body: Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              box.erase();
              context.pushPage(LoginScreen());
            },
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.white,
                fixedSize: Size(200, 50)),
            child: const Text(
              'Log out',
              style: fontButtom,
            ),
          ),
        ));
  }
}
