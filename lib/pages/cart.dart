import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zanzeeapp/pages/menu.dart';
import 'package:zanzeeapp/providers/cartprovider.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:zanzeeapp/theme/color.dart';

import '../components/cart/itemscard.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                              (index) => cartItemsCard(
                                  context, value.cart[index].toJson()))),
                    )
                  ]),
            ))
          : Center(
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
            ),
      bottomNavigationBar: Provider.of<CartProvider>(context).cart.isNotEmpty
          ? Consumer<CartProvider>(
              builder: (context, value, child) => InkWell(
                    onTap: () {
                      handlePaymentInitialization(context);
                    },
                    child: cartButton(context, value),
                  ))
          : null,
    );
  }

  Padding cartButton(BuildContext context, CartProvider value) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.black),
          child: Center(
            child: Text(
              "Make Payment - ₦${value.totalPrice}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
    );
  }

  handlePaymentInitialization(BuildContext context) async {
    final Customer customer = Customer(
        name: "Flutterwave Developer",
        phoneNumber: "1234566677777",
        email: "coolmirth35@gmail.com");
    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: "FLWPUBK_TEST-11c145c78c299e76279a6a8b7fe585f8-X",
        currency: "NGN",
        redirectUrl: "add-your-redirect-url-here",
        txRef: "add-your-unique-reference-here",
        amount: "3000",
        customer: customer,
        paymentOptions:
            "ussd, card, barter, payattitude, banktransfer, account ",
        customization: Customization(title: "My Payment"),
        isTestMode: true);
    final ChargeResponse response = await flutterwave.charge();
    if (context.mounted) showLoading(context, response.toString());

    print("${response.toJson()}");
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
            height: 50,
            child: Text(message),
          ),
        );
      },
    );
  }
}
