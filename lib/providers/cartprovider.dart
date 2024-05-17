import 'package:flutter/material.dart';

import '../utils/models.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> cart = [];
  List cartToSend = [];
  int price = 0;
  int amount = 0;
  int totalPrice = 0;
  bool isbuttonDisabled = false;

  get populateCartToSend {
    for (var element in cart) {
      cartToSend.add(element.toJson());
    }
    return cartToSend;
  }

  add(String id, String name, int price, String image, String options,
      List extras, List cutleries, int amount) {
    cart.add(CartModel(
        id: id,
        name: name,
        price: price,
        image: image,
        options: options,
        extras: extras,
        cutleries: cutleries,
        amount: amount));
    notifyListeners();
    addUpPrices();
  }

  void addUpPrices() {
    price = 0;
    int interimPrice = 0;
    totalPrice = 0;
    // int extraPrice = 0;
    if (cart.isNotEmpty) {
      for (var item in cart) {
        // if (item.extras.isNotEmpty) {
        //   for (var extra in item.extras) {
        //     extraPrice += extra["price"] as int;
        //   }
        // }
        interimPrice += (item.price * item.amount);
      }
      totalPrice = (price + interimPrice);
    }
  }

  void calculateTotal() {}

  del(int index) {
    cart.removeAt(index);

    notifyListeners();
    addUpPrices();
  }

  getCart(String id) {
    try {
      var cartItem = cart.firstWhere((element) => element.id == id);
      return cartItem.toJson();
    } catch (e) {
      return false;
    }
  }

  List<CartModel> get items {
    return [...cart];
  }

  getAllCarts() {
    List carts = [];
    for (var element in cart) {
      carts.add(element);
    }
    return carts;
  }

  updateCart(String id, CartModel update) {
    for (var element in cart) {
      if (element.id == id) {
        element = update;
      }
    }
  }

  void increaseAmout(String id) {
    for (var element in cart) {
      if (element.id == id) {
        element.amount++;
      }
    }

    notifyListeners();
    addUpPrices();
  }

  void decreaseAmout(String id) {
    for (var (index, element) in cart.indexed) {
      if (element.id == id) {
        if (element.amount > 1) {
          element.amount--;

          notifyListeners();
          addUpPrices();
        } else {
          del(index);
        }
      }
    }
  }

  handleButtonState(nameController, tableNumberController) {
    if (nameController.text == '' || tableNumberController.text == '') {
      isbuttonDisabled = true;
    } else {
      isbuttonDisabled = false;
    }
    notifyListeners();
  }

  emptyCart() {
    cartToSend.clear();
    price = 0;
    amount = 0;
    totalPrice = 0;
    cart.clear();
    notifyListeners();
    // addUpPrices();
  }
}
