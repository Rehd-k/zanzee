import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zanzeeapp/components/appbar.dart';
import 'package:zanzeeapp/components/searchbar.dart';

import '../components/adds.dart';
import '../components/categories.dart';
import '../components/mainheader.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            mainHeader(),
            const SizedBox(
              height: 20,
            ),
            buildSearch(
                "Search", Icons.search_rounded, FontAwesomeIcons.filter),
            const SizedBox(
              height: 20,
            ),
            buildCategories(selectCat, catIndex),
            const SizedBox(
              height: 20,
            ),
            buildAdsImage(),
          ],
        ),
      ),
    );
  }
}
