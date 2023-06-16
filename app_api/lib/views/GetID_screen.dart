import 'dart:convert';
import 'package:app_api/services/api/User/getByID.dart';
import 'package:app_api/services/extan/navigitor/pushEXT.dart';
import 'package:app_api/services/extan/textfield.dart';
import 'package:app_api/views/other/fonts.dart';
import 'package:app_api/views/other/spaces.dart';
import 'package:flutter/material.dart';

class GetScreenID extends StatefulWidget {
  const GetScreenID({super.key});

  @override
  State<GetScreenID> createState() => _GetScreenIDState();
}

class _GetScreenIDState extends State<GetScreenID> {
  Map order = {};
  final TextEditingController idController = TextEditingController();
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
                Icons.perm_identity_sharp,
              ),
              kVSpace2,
              Text(
                "Get by ID",
                style: fontAppBar,
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios_new),
          )),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(100),
              child: Column(
                children: [
                  Column(children: [
                    TextFieldCustom(
                        controller: idController,
                        hint: "enter id",
                        label: "ID",
                        icon: Icons.insert_drive_file),
                    kVSpace4,
                    Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              try {
                                if (int.parse(idController.text) is int) {
                                  order = json.decode(
                                      (await getByID(id: idController.text))
                                          .body);
                                  print(order);
                                  if ((order["data"] as List).isEmpty) {
                                    order = {};
                                  } else {
                                    order = order["data"][0];
                                  }

                                  setState(() {});
                                }
                              } catch (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "plase enter correct number")));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: Colors.white,
                                fixedSize: Size(200, 50)),
                            child: const Text(
                              "Get",
                              style: fontButtom,
                            ))),
                  ]),
                  kVSpace64,
                  Center(
                    child: Container(
                      height: 200,
                      width: context.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[800],
                        boxShadow: List.empty(growable: true),
                      ),
                      child: Visibility(
                          visible: order.isNotEmpty,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("ID : ${order["id"].toString()}"),
                                    Text("TITLE : ${order["title"]}"),
                                    Text("CONTENT : ${order["content"]}"),
                                    Text("CREATE AT : ${order["create_at"]}"),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
