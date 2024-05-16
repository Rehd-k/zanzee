import 'package:flutter/material.dart';
import 'package:zanzeeapp/widgets/notification_box.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.clear_all_rounded,
              size: 28,
            ),
          ),
        ),
        const NotificationBox(
          number: 1,
        )
      ],
    ),
  );
}
