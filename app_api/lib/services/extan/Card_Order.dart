import 'package:flutter/material.dart';

class CardOrders extends StatelessWidget {
  const CardOrders({super.key, required this.order});
  final Map order;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 100, right: 100, top: 50),
      //padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(order["title"]),
          subtitle: Text(order["content"]),
          trailing: Text(order["create_at"]),
          selectedColor: Colors.blueGrey,
        ),
      ),
    );
  }
}
