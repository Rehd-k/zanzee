import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zanzeeapp/components/appbar.dart';
import 'package:zanzeeapp/theme/color.dart';

import 'package:zanzeeapp/widgets/feature_item.dart';

import '../components/adds.dart';
import '../components/categories.dart';
import '../components/mainheader.dart';
import '../components/populars.dart';
import '../components/searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  int catIndex = 0;

  void selectCat(index) {
    setState(() {
      catIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: buildAppBar(),
      body: _buildBody(selectCat, catIndex, firestore),
    );
  }

  _buildBody(selectCat, catIndex, firestore) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mainHeader(),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Find Your Meals",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildSearch("Search", Icons.search_rounded, FontAwesomeIcons.filter),
          const SizedBox(
            height: 25,
          ),
          buildAdsImage(firestore),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: darker),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          buildPopulars(firestore),
          const SizedBox(
            height: 20,
          ),
          buildCategories(selectCat, catIndex),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Featured",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: _buildFeatured(),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  _buildFeatured() {
    return StreamBuilder(
        stream: firestore
            .collection('products')
            .where('is_featured', isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: List.generate(
                snapshot.data!.docs.length,
                (index) => FeaturedItem(data: snapshot.data!.docs[index]),
              ),
            );
          }
        });
  }
}
