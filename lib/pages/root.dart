import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zanzeeapp/pages/cart.dart';
import 'package:zanzeeapp/pages/explore.dart';
import 'package:zanzeeapp/pages/menu.dart';
import 'package:zanzeeapp/theme/color.dart';
import 'package:zanzeeapp/widgets/bottombar_item.dart';
import '../providers/cartprovider.dart';
import 'home.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _activeTab = 0;

  final List<IconData> _tapIcons = [
    Icons.home_rounded,
    Icons.explore_rounded,
    Icons.menu_book_rounded,
    Icons.person_rounded
  ];

  final List<Widget> _pages = [
    const HomePage(),
    const ExplorePage(),
    const MenuPage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        bottomNavigationBar: _buildBottomBar(),
        body: _buildBarPage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          },
          child: Consumer<CartProvider>(
              builder: (context, value, child) => Text(
                    value.cart.length.toString(),
                  )),
        ));
  }

  Widget _buildBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: bottomBarColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            blurRadius: .5,
            spreadRadius: .5,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          _tapIcons.length,
          (index) => BottomBarItem(
            _tapIcons[index],
            isActive: _activeTab == index,
            activeColor: primary,
            onTap: () {
              setState(() {
                _activeTab = index;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBarPage() {
    return IndexedStack(
      index: _activeTab,
      children: List.generate(
        _tapIcons.length,
        (index) => _pages[index],
      ),
    );
  }
}
