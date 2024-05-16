import 'package:flutter/material.dart';
import 'package:zanzeeapp/pages/details.dart';

class MenuItem extends StatelessWidget {
  final Map menuItem;
  const MenuItem({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(itemId: menuItem['id']),
          ),
        );
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.2))]),
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: menuItem["sources"] == "drinks"
                      ? const Icon(Icons.liquor_outlined)
                      : const Icon(Icons.restaurant_menu)),
              Expanded(
                  child: Column(
                children: [
                  Text(menuItem["name"]),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const LinearProgressIndicator(
                      value: 0.4,
                    ),
                  )
                ],
              )),
              Text('₦${menuItem["price"]}')
            ],
          )),
    );
  }
}
