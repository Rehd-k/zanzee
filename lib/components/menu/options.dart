import 'package:flutter/material.dart';

servingOptions(
    selectedOption, handleOptionChange, options, index, bool exists) {
  return SizedBox(
    height: 30,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.add_box, color: exists ? Colors.black : Colors.grey),
        const SizedBox(width: 5),
        Text(options,
            style: TextStyle(color: exists ? Colors.black : Colors.grey)),
        Expanded(
          child: Container(),
        ),
        Radio(
          fillColor: exists ? null : WidgetStateProperty.all(Colors.grey),
          value: options,
          groupValue: selectedOption,
          onChanged: (value) {
            exists ? handleOptionChange(value) : null;
          },
        )
      ],
    ),
  );
}
