import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:zanzeeapp/pages/details.dart';

buildAdsImage(FirebaseFirestore firestore) {
  return StreamBuilder(
      stream: firestore
          .collection('products')
          .where('is_add', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return CarouselSlider.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int itemIndex,
                      int pageViewIndex) =>
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailsPage(
                                  itemId: snapshot.data!.docs[itemIndex].id)));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              snapshot.data!.docs[itemIndex]['image']),
                        ),
                      ),
                    ),
                  ),
              options: CarouselOptions(viewportFraction: 1, autoPlay: true));
        }
      });
}
