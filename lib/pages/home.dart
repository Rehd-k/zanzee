import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zanzeeapp/components/appbar.dart';
import 'package:zanzeeapp/theme/color.dart';
import 'package:zanzeeapp/utils/data.dart';

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
      body: _buildBody(selectCat, catIndex),
    );
  }

  _buildBody(selectCat, catIndex) {
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
          buildAdsImage(),
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
          buildPopulars(populars),
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
    return Column(
      children: List.generate(
        featured.length,
        (index) => FeaturedItem(data: featured[index]),
      ),
    );
  }
}
