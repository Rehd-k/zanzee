import 'package:flutter/material.dart';

cutlery(List selectedCutlery, Function handleAddOnChangeChange, String option,
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
          option,
          style: TextStyle(color: exists ? Colors.black : Colors.grey),
        ),
        Expanded(
          child: Container(),
        ),
        Checkbox(
          fillColor: exists ? null : MaterialStateProperty.all(Colors.grey),
          value: selectedCutlery.contains(option),
          onChanged: (value) {
            exists ? handleAddOnChangeChange(option) : null;
          },
        )
      ],
    ),
  );
}
