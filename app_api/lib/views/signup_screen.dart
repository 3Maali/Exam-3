import 'dart:convert';
import 'package:app_api/services/api/Auth/createUser.dart';
import 'package:app_api/services/extan/navigitor/pushEXT.dart';
import 'package:app_api/services/extan/textfield.dart';
import 'package:app_api/views/Login_screen.dart';
import 'package:app_api/views/loding_screen.dart';
import 'package:app_api/views/style/fonts.dart';
import 'package:app_api/views/style/spaces.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        foregroundColor: Colors.white,
        elevation: 10,
        toolbarHeight: 50,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_add,
            ),
            kVSpace2,
            Text(
              "Sign Up",
              style: fontAppBar,
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 200, right: 200, top: 30, bottom: 5),
            child: Container(
              height: 350,
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
                    hint: "username",
                    label: "User Name",
                    icon: Icons.person,
                    onChanged: (value) {
                      print(value);
                      username = value;
                    },
                  ),
                  TextFieldCustom(
                    hint: "name",
                    label: "Name",
                    icon: Icons.notes,
                    controller: nameController,
                  ),
                  TextFieldCustom(
                    hint: "example@gmail.com",
                    label: "Email",
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  TextFieldCustom(
                    hint: "******",
                    label: "password",
                    icon: Icons.password,
                    isPassword: true,
                    onChanged: (pass) {
                      password = pass;
                    },
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                kVSpace4,
                ElevatedButton(
                  onPressed: () async {
                    final Map body = {
                      "email": emailController.text,
                      "password": password,
                      "username": username,
                      "name": nameController.text
                    };
                    final response = await createUser(body: body);

                    if (response.statusCode == 200) {
                      LodgingPage();
                      context.pushPage(LodgingPage());
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
                    'Create Account',
                    style: fontButtom,
                  ),
                ),
                kVSpace2,
                TextButton(
                  onPressed: () {
                    context.pushPage(LoginScreen());
                  },
                  child: const Text("Already have Account", style: bluefont),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
