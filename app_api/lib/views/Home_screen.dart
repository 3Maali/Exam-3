import 'dart:convert';
import 'package:app_api/services/api/User/create_order.dart';
import 'package:app_api/services/api/User/get_orders.dart';
import 'package:app_api/services/extan/navigitor/pushEXT.dart';
import 'package:app_api/services/extan/textfield.dart';
import 'package:app_api/services/extan/Card_Order.dart';
import 'package:app_api/views/GetID_screen.dart';
import 'package:app_api/views/Login_screen.dart';
import 'package:app_api/views/Logout.dart';
import 'package:app_api/views/order_screen.dart';
import 'package:app_api/views/style/fonts.dart';
import 'package:app_api/views/style/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  List listOrders = [];
  @override
  void initState() {
    super.initState();
    _test();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        foregroundColor: Colors.white,
        elevation: 10,
        toolbarHeight: 50,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pushPage(LogoutScreen());
          },
          icon: Icon(Icons.logout),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
            ),
            kVSpace2,
            Text(
              "HomePage",
              style: fontAppBar,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.pushPage(GetScreenID());
            },
            icon: Icon(Icons.arrow_forward_ios_rounded),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 200, right: 200, top: 50),
            child: Container(
              height: 200,
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
                      hint: "Title",
                      label: "Title",
                      controller: titleController,
                      icon: Icons.content_copy),
                  TextFieldCustom(
                    hint: "content",
                    label: "content",
                    controller: contentController,
                    icon: Icons.read_more,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.white,
                fixedSize: Size(200, 50)),
            child: const Text(
              "GetData",
              style: fontButtom,
            ),
            onPressed: () async {
              final result = await createOrder(context: context, body: {
                "title": titleController.text,
                "content": contentController.text
              });

              _test();
            },
          )),

          const SizedBox(
            height: 30,
          ),

          //-------------- display orders ---------------
          const Text(
            "All Orders :",
            style: TextStyle(fontSize: 15),
          ),

          for (int i = listOrders.length - 1;
              i <= listOrders.length && i > 0;
              i--)
            InkWell(
                onTap: () {
                  context.pushPage(OrderScreen(order: listOrders[i]));
                },
                child: CardOrders(order: listOrders[i])),
        ],
      ),
    );
  }

  _test() async {
    if ((await getOrders()).statusCode == 200) {
      listOrders = json.decode((await getOrders()).body)["data"];

      setState(() {});
    } else {
      final box = GetStorage();
      box.remove("token");

      context.pushPage(LoginScreen());
    }
  }
}
