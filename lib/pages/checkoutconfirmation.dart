import 'package:flutter/material.dart';

import '../theme/color.dart';

class Checkoutconfirmation extends StatelessWidget {
  const Checkoutconfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        children: [
          Center(child: Image.asset('images/check-mark.png')),
          const SizedBox(
            height: 30,
          ),
          const Text('Payment Confirmed', style: TextStyle(color: primary)),
          const SizedBox(
            height: 30,
          ),
          const Row(children: [Text('Name : '), Text('Chukwuma')]),
          const Row(children: [Text('Table : '), Text('5')])
        ],
      ),
    ));
  }
}
