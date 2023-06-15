import 'package:app_api/services/extan/navigitor/pushEXT.dart';
import 'package:app_api/views/loding_screen.dart';
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
          backgroundColor: Colors.white,
          foregroundColor: Colors.blueGrey,
          elevation: 10,
          toolbarHeight: 50,
          centerTitle: true,
          title: const Text("Log out" , style: TextStyle( fontSize: 15),)
        ),
        body: Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              box.erase();
              context.pushPage(LodgingPage());
            },
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.white,
                fixedSize: Size(200, 50)),
            child: const Text(
              'Log out',style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ));
  }
}
