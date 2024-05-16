import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zanzeeapp/providers/cartprovider.dart';
import 'package:zanzeeapp/theme/color.dart';

import '../components/menu/cutlery.dart';
import '../components/menu/extraaddons.dart';
import '../components/menu/options.dart';

class ProductDetailsPage extends StatefulWidget {
  final String itemId;
  const ProductDetailsPage({Key? key, required this.itemId}) : super(key: key);

  @override
  ProductDetailsPageState createState() => ProductDetailsPageState();
}

class ProductDetailsPageState extends State<ProductDetailsPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String selectedOption;
  List<Map> selectedExtra = [];
  List<String> selectedCutlery = [];
  int price = 0;
  int amount = 1;
  late Map cartItem = {};
  // ignore: prefer_typing_uninitialized_variables
  late final menuItemG;
  late Future getMeMyDetails;

  void handleOptionChange(value) {
    setState(() {
      selectedOption = value!;
    });
  }

  void handleAddOnChangeChange(value) {
    setState(() {
      if (selectedExtra.contains(value)) {
        selectedExtra.remove(value);
      } else {
        selectedExtra.add(value);
      }
    });
    addUpPrices();
  }

  void handleAddCutlery(value) {
    setState(() {
      if (selectedCutlery.contains(value)) {
        selectedCutlery.remove(value);
      } else {
        selectedCutlery.add(value);
      }
    });
  }

  void addUpPrices() {
    dynamic interimPrice = 0;
    price = 0;
    if (selectedExtra.isNotEmpty) {
      for (var item in selectedExtra) {
        interimPrice += item["price"];
      }
    }

    price += interimPrice as int;
    price += menuItemG["price"] as int;
  }

  Future getProduct(productId) async {
    try {
      final docRef = _firestore.collection('products').doc(productId);
      final document = await docRef.get();
      menuItemG = document.data()!;
      selectedOption = menuItemG["options"][0];
      addUpPrices();
      return menuItemG;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getMeMyDetails = getProduct(widget.itemId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMeMyDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final menuItem = snapshot.data;
            return Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: _buildLeading(context),
                actions: [
                  _buildFevortite(),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildImage(context, snapshot.data),
                    _buildBody(snapshot.data)
                  ],
                ),
              ),
              bottomNavigationBar: _addToCart(menuItem),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error loading data"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  IconButton _buildLeading(BuildContext context) {
    return IconButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white)),
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back));
  }

  Padding _buildFevortite() {
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.white)),
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline)));
  }

  Padding _buildBody(menuItem) {
    return Padding(
        padding:
            const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(menuItem["name"],
              style:
                  const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 5,
          ),
          Text('₦ ${menuItem["price"]}',
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 5,
          ),
          Text(menuItem["description"]),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Choice of Service",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "🗸 Required",
                  style: TextStyle(color: Colors.green),
                )
              ]),
          const SizedBox(
            height: 10,
          ),
          Container(
              child: menuItem["options"].length < 1
                  ? _noArrayToDisplay('No Serving Option For This Option')
                  : _buildOptions(menuItem)),
          const SizedBox(
            height: 20,
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "Extra Add On",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
          const SizedBox(
            height: 10,
          ),
          _buildAddOns(menuItem),
          const SizedBox(height: 20),
          const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "Need Cutlery",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
          const SizedBox(height: 10),
          _buildCutlery(menuItem)
        ]));
  }

  Container _buildAddOns(menuItem) {
    return Container(
      child: menuItem["extras"].length < 1
          ? _noArrayToDisplay('No Extra Addon For This Option')
          : Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: menuItem["extras"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return extraAddons(
                          selectedExtra,
                          handleAddOnChangeChange,
                          menuItem["extras"][index],
                          index,
                          checkIfInCard(widget.itemId) == false);
                    })
              ],
            ),
    );
  }

  Column _buildOptions(menuItem) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: menuItem["options"].length,
            itemBuilder: (BuildContext context, int index) {
              return servingOptions(
                  selectedOption,
                  handleOptionChange,
                  menuItem["options"][index],
                  index,
                  checkIfInCard(widget.itemId) == false);
            })
      ],
    );
  }

  Image _buildImage(BuildContext context, menuItem) {
    return Image.network(
      menuItem["image"],
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }

  Container _buildCutlery(menuItem) {
    return Container(
        child: menuItem["cutleries"].length < 1
            ? _noArrayToDisplay('No Cutlery For This Option')
            : Column(children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: menuItem["cutleries"].length,
                    itemBuilder: (BuildContext context, int index) {
                      return cutlery(
                          selectedCutlery,
                          handleAddCutlery,
                          menuItem["cutleries"][index],
                          checkIfInCard(widget.itemId) == false);
                    })
              ]));
  }

  checkIfInCard(String id) {
    var exists = Provider.of<CartProvider>(context).getCart(id);
    return exists;
  }

  Container _addToCart(menuItem) {
    return Container(
      child: checkIfInCard(widget.itemId) == false
          ? Consumer<CartProvider>(
              builder: (context, value, child) => InkWell(
                    onTap: () {
                      value.add(
                          widget.itemId,
                          menuItem["name"],
                          price,
                          menuItem["image"],
                          selectedOption,
                          selectedExtra,
                          selectedCutlery,
                          amount);
                    },
                    child: cartButton(context),
                  ))
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _reduceQnt(menuItem),
                  Text(
                    "${checkIfInCard(widget.itemId)["amount"]} - ₦${(price * checkIfInCard(widget.itemId)["amount"]).toString()}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primary),
                  ),
                  _increaseQnt(menuItem)
                ],
              ),
            ),
    );
  }

  Consumer<CartProvider> _increaseQnt(menuItem) {
    return Consumer<CartProvider>(
        builder: (context, value, child) => InkWell(
            onTap: () {
              value.increaseAmout(widget.itemId);
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black),
                child: const Center(
                    child: Icon(
                  Icons.add,
                  color: primary,
                )))));
  }

  Consumer<CartProvider> _reduceQnt(menuItem) {
    return Consumer<CartProvider>(
        builder: (context, value, child) => InkWell(
            onTap: () {
              value.decreaseAmout(widget.itemId);
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black),
                child: const Center(
                    child: Icon(
                  Icons.remove,
                  color: Colors.white,
                )))));
  }

  Padding cartButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
          height: 45,
          width: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.black),
          child: const Center(
            child: Text(
              "Add To Cart",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
    );
  }

  _noArrayToDisplay(fillerText) {
    return SizedBox(
      height: 60,
      child: Center(
        child: Text(fillerText),
      ),
    );
  }
}
