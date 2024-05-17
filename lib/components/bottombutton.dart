import 'package:flutter/material.dart';

Padding buttomButton(BuildContext context, value, text) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.black),
        child: Center(
          child: Text(
            "$text - ₦$value",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
  );
}
