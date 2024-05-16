import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String id;
  const OrderPage({Key? key, required this.id}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
