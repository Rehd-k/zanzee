import 'package:flutter/material.dart';

class SilverHeader extends StatelessWidget {
  final Map menuItem;
  const SilverHeader({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white)),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          }),
      expandedHeight: 250.0,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
        menuItem["image"],
        fit: BoxFit.cover,
      )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5, right: 10),
          child: Row(
            children: [
              IconButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline)),
            ],
          ),
        )
      ],
    );
  }
}
