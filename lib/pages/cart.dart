import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:zanzeeapp/pages/menu.dart';
import 'package:zanzeeapp/providers/cartprovider.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:zanzeeapp/theme/color.dart';

import '../components/bottomButton.dart';
import '../components/cart/itemscard.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController tableNumberController = TextEditingController();

    makeOrder(CartProvider value) {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      Map<String, dynamic> order = {
        "name": nameController.text,
        "status": "pending",
        "table": tableNumberController.text,
        "totalAmount": value.totalPrice.toString(),
        'cart': value.populateCartToSend
      };

      firestore
          .collection('orders')
          .add(order)
          .then((gIvenvalue) => value.emptyCart());
    }

    return Scaffold(
      appBar: AppBar(),
      body: Provider.of<CartProvider>(context).cart.isNotEmpty
          ? SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Cart',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800)),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Items in your Cart',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  '+ Add More',
                                  // style: TextStyle(color: primary),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Consumer<CartProvider>(
                          builder: (context, value, child) => Column(
                              children: List.generate(
                                  value.cart.length.toInt(),
                                  (index) => cartItemsCard(context,
                                      value.cart[index].toJson(), false))),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        buildTextHolder(nameController, tableNumberController)
                      ])))
          : emptyCart(context),
      bottomNavigationBar: Provider.of<CartProvider>(context).cart.isNotEmpty
          ? Consumer<CartProvider>(
              builder: (context, value, child) => InkWell(
                    onTap: () {
                      handlePaymentInitialization(context, makeOrder, value);
                    },
                    child:
                        buttomButton(context, value.totalPrice, 'Make Payment'),
                  ))
          : null,
    );
  }

  Column buildTextHolder(TextEditingController nameController,
      TextEditingController tableNumberController) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Name :'),
          const SizedBox(width: 100),
          Expanded(
              child: TextField(
            controller: nameController,
            textAlign: TextAlign.left,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Please input a name',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ))
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Table Number :'),
          const SizedBox(width: 50),
          Expanded(
              child: TextField(
            controller: tableNumberController,
            textAlign: TextAlign.left,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Table number closest to you',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ))
        ],
      ),
    ]);
  }

  Center emptyCart(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const Icon(FontAwesomeIcons.hourglass),
          const SizedBox(
            height: 40,
          ),
          const Text('What !, your cart is empty'),
          TextButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuPage(),
                    ),
                  ),
              child: const Text(
                'Lets fix that here',
                style: TextStyle(color: primary),
              ))
        ],
      ),
    );
  }

  handlePaymentInitialization(BuildContext context, makeOrder, value) async {
    var uuid = const Uuid();
    final Customer customer = Customer(
        name: "Flutterwave Developer",
        phoneNumber: "1234566677777",
        email: "coolmirth35@gmail.com");
    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: "FLWPUBK_TEST-11c145c78c299e76279a6a8b7fe585f8-X",
        currency: "NGN",
        redirectUrl: "google.com",
        txRef: uuid.v4(),
        amount: "3000",
        customer: customer,
        paymentOptions:
            "ussd, card, barter, payattitude, banktransfer, account ",
        customization: Customization(title: "My Payment"),
        isTestMode: true);
    final ChargeResponse response = await flutterwave.charge();
    makeOrder(value);
    if (context.mounted) showLoading(context, response.toString());
  }

  Future<void> showLoading(BuildContext context, String message) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Text(message),
          ),
        );
      },
    );
  }
}
