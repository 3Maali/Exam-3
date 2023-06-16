import 'package:app_api/services/extan/navigitor/pushEXT.dart';
import 'package:app_api/views/other/fonts.dart';
import 'package:app_api/views/other/spaces.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key, required this.order});

  final Map order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white30,
          foregroundColor: Colors.white,
          elevation: 10,
          toolbarHeight: 50,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.note,
              ),
              kVSpace2,
              Text(
                "Order : ${order["title"]}",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
          )),
      body: Padding(
        padding: const EdgeInsets.only(left: 100.0, right: 100.0, top: 200.0),
        child: ListView(children: [
          Card(
            shadowColor: Colors.black,
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.perm_identity_sharp,
                            size: 15,
                          ),
                          Text(order["id"].toString(), style: fontInfo),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.paste_rounded,
                            size: 15,
                          ),
                          Text(order["title"], style: fontInfo),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.watch_later_outlined,
                            size: 15,
                          ),
                          Text(order["create_at"], style: fontInfo),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.read_more_sharp,
                        size: 15,
                      ),
                      Text("Content :", style: fontContent),
                      kVSpace4,
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          order["content"],
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                          softWrap: true,
                          maxLines: 5,
                        ),
                        // ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
