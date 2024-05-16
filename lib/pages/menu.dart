import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zanzeeapp/components/menu/menulist.dart';
import 'package:zanzeeapp/components/searchbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/categories.dart';
import '../components/mainheader.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int catIndex = 0;
  List filteredList = [];
  late Widget menuView;
  List products = [];
  late Future _myFuture;

  void selectCat(index, filter) {
    setState(() {
      catIndex = index;
    });
    doFilter(filter);
  }

  void doFilter(String filter) {
    var innerList = [];
    if (filter == 'all') {
      innerList = products;
    } else {
      for (var element in products) {
        if (element["tags"].contains(filter)) {
          innerList.add(element);
        }
      }
    }
    setState(() {
      filteredList = innerList;
    });
  }

  Future getMenu() async {
    final QuerySnapshot<Map<String, dynamic>> menuItems;
    try {
      menuItems = await _firestore.collection("products").get();
      for (var docSnapshot in menuItems.docs) {
        var product = docSnapshot.data();
        product['id'] = docSnapshot.id;
        products.add(product);
      }

      filteredList = products;
      return filteredList;
    } catch (e) {
      (e) => {throw Error()};
    }
  }

  @override
  void initState() {
    _myFuture = getMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
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
            FutureBuilder(
                future: _myFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return _buildMenuLIst();
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error loading data"),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }

  Container _buildMenuLIst() {
    return Container(
        child: filteredList.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: filteredList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MenuItem(menuItem: filteredList[index]);
                })
            : const Center(
                child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Icon(
                    FontAwesomeIcons.faceSadTear,
                    size: 30,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Nothing Like that here ...'),
                  Center(child: Text('No Vex'))
                ],
              )));
  }
}
