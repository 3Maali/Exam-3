import 'dart:convert';

import 'package:app_api/services/api/Auth/login.dart';
import 'package:app_api/services/extan/loading.dart';
import 'package:app_api/services/extan/navigitor/pushEXT.dart';
import 'package:app_api/services/extan/textfield.dart';
import 'package:app_api/views/Home_screen.dart';
import 'package:app_api/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueGrey,
        elevation: 10,
        toolbarHeight: 50,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Log In   ",
              style: TextStyle(fontSize: 15),
            ),
            Icon(Icons.login)
          ],
        ),
      ),
      body: ListView(children: [
        Padding(
          // padding: const EdgeInsets.only(left: 200.0, right: 200.0),
          padding: const EdgeInsets.only(left: 200, right: 200, top: 50),
          child: Container(
            height: 300,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[800],
              boxShadow: List.empty(growable: true),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: [
                TextFieldCustom(
                  hint: "example@gmail.com",
                  label: "Email",
                  icon: Icons.email,
                  controller: emailController,
                ),
                TextFieldCustom(
                  hint: "******",
                  label: "Password",
                  icon: Icons.password,
                  isPassword: true,
                  controller: passwordController,
                ),
              ],
            ),
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final Map body = {
                      "email": emailController.text,
                      "password": passwordController.text,
                    };
                    final response = await loginUser(body: body);

                    if (response.statusCode == 200) {
                      final box = GetStorage();
                      box.write(
                          "token", json.decode(response.body)["data"]["token"]);


                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false);
                      lodingPage(context: context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(jsonDecode(response.body)["msg"])));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      backgroundColor: Colors.white,
                      fixedSize: Size(200, 50)),
                  child: const Text(
                    'Log in',
                    // style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  //---------------
                  onPressed: () {
                    // context.pushAndRemove(view: SignUpScreen());
                    context.pushPage(SignUpScreen());
                  },
                  child: const Text(
                    "Does not have account",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.blue),
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}
