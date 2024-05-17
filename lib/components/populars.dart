import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zanzeeapp/widgets/popular_item.dart';

buildPopulars(FirebaseFirestore firestore) {
  return StreamBuilder(
      stream: firestore
          .collection('products')
          .where('is_popular', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: List.generate(
                snapshot.data!.docs.length,
                (index) => PopularItem(
                  data: snapshot.data!.docs[index],
                ),
              ),
            ),
          );
        }
      });
}
