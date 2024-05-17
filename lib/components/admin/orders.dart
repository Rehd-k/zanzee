import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zanzeeapp/components/cart/itemscard.dart';
import 'package:zanzeeapp/theme/color.dart';

import '../bottomButton.dart';

class OrderPage extends StatefulWidget {
  final dynamic order;
  const OrderPage({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.order);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
              children: List.generate(
                  widget.order['cart'].length.toInt(),
                  (index) => cartItemsCard(
                      context, widget.order['cart'][index], true))),
        ],
      ),
      bottomNavigationBar: InkWell(
          onTap: () {
            String status;

            switch (widget.order['status']) {
              case 'pending':
                status = 'doing';
                break;
              case 'doing':
                status = 'done';
                break;
              case 'done':
                status = 'done';
                break;
              default:
                status = 'pending';
            }

            if (status != 'done') {
              final FirebaseFirestore firestore = FirebaseFirestore.instance;
              final order = firestore.collection("orders").doc(widget.order.id);
              order.update({"status": status}).then(
                  (value) =>
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                            'Done',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: primary)),
                  onError: (e) =>
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            e,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: primary)));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'Already Done',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: primary));
            }
          },
          child:
              buttomButton(context, widget.order['totalAmount'], 'Confirm ?')),
    );
  }
}
