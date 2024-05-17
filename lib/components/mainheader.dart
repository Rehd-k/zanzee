import 'package:flutter/material.dart';

Padding mainHeader() {
  return const Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello!",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          CircleAvatar()
        ],
      ));
}
