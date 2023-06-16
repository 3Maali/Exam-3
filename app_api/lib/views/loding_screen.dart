import 'package:app_api/services/extan/loading.dart';
import 'package:app_api/views/Home_screen.dart';
import 'package:app_api/views/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LodgingPage extends StatefulWidget {
  const LodgingPage({super.key});

  @override
  State<LodgingPage> createState() => _LodgingPageState();
}

class _LodgingPageState extends State<LodgingPage> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    lodingPage(context: context);
    return box.hasData("token") ? const HomeScreen() : LoginScreen();
  }
}
