import 'package:flutter/material.dart';
import 'package:zanzeeapp/widgets/popular_item.dart';

buildPopulars(populars) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.only(left: 15),
    child: Row(
      children: List.generate(
        populars.length,
        (index) => PopularItem(
          data: populars[index],
        ),
      ),
    ),
  );
}
