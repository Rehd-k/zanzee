import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zanzeeapp/providers/cartprovider.dart';
import 'package:zanzeeapp/theme/color.dart';

cartItemsCard(BuildContext context, item) {
  Size screenSize = MediaQuery.of(context).size;
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    height: screenSize.width * .25,
    width: screenSize.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImage(screenSize, item["image"]),
        const SizedBox(width: 10),
        _buildDetails(item),
        SizedBox(
          height: double.infinity,
          child: _buildActionButtons(item),
        )
      ],
    ),
  );
}

Column _buildActionButtons(item) {
  return Column(children: [
    Expanded(
        child: SizedBox(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<CartProvider>(
                builder: (context, value, child) => IconButton(
                    onPressed: () {
                      value.decreaseAmout(item["id"]);
                    },
                    icon: const Icon(Icons.remove_circle))),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(item["amount"].toString()),
            ),
            Consumer<CartProvider>(
                builder: (context, value, child) => IconButton(
                    onPressed: () {
                      value.increaseAmout(item["id"]);
                    },
                    icon: const Icon(Icons.add_circle)))
          ],
        ),
      ),
    ))
  ]);
}

ClipRRect _buildImage(Size screenSize, image) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.network(
      image,
      fit: BoxFit.fill,
      width: screenSize.width * .2,
      height: screenSize.width * .2,
    ),
  );
}

Expanded _buildDetails(cart) {
  num prices = cart["price"] * cart["amount"];
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cart["name"],
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text('₦ ${prices.toString()}',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey)),
        _buildExtras(cart["extras"])
      ],
    ),
  );
}

SingleChildScrollView _buildExtras(extra) {
  return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          extra.length,
          (index) => Container(
            margin: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: Text(extra[index]["item"]),
          ),
        ),
      ));
}
