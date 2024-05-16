import 'package:flutter/material.dart';

extraAddons(List selectedExtra, handleAddOnChangeChange, Map options, int index,
    bool exists) {
  return SizedBox(
    height: 30,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.add_box, color: exists ? Colors.black : Colors.grey),
        const SizedBox(width: 5),
        Text(
          options["item"],
          style: TextStyle(color: exists ? Colors.black : Colors.grey),
        ),
        Expanded(
          child: Container(),
        ),
        Text(
          '₦ ${options["price"].toString()}',
          style: TextStyle(color: exists ? Colors.black : Colors.grey),
        ),
        Checkbox(
          fillColor: exists ? null : WidgetStateProperty.all(Colors.grey),
          value: selectedExtra.contains(options),
          onChanged: (value) {
            exists ? handleAddOnChangeChange(options) : null;
          },
        )
      ],
    ),
  );
}
