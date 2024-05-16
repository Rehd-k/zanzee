import 'package:flutter/material.dart';
import 'package:zanzeeapp/widgets/category_item.dart';

import '../utils/data.dart';

buildCategories(selectCat, catIndex) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.only(bottom: 5, left: 15),
    child: Row(
      children: [
        ...List.generate(
          categories.length,
          (index) => CategoryItem(
              data: categories[index],
              onTap: () => {selectCat(index, categories[index]["name"])},
              seleted: catIndex == index),
        )
      ],
    ),
  );
}
