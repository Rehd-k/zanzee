import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List populars = [
  {
    "id": "1",
    "image": "https://ik.imagekit.io/t2ahazwe2gu/zanzee/images/suya_oc7JqdPXt.jpg?updatedAt=1715863133650&tr=w-1080%2Ch-1920%2Cfo-auto",
    "is_favorited": true,
    "price": "3000",
    "name": "Beef Suya",
    "description":
        "Experience the sizzle of succulent meats kissed by open flames, delivering a symphony of flavors in every juicy bite. Suya: where tender cuts meet irresistible spices, igniting your taste buds with a tantalizing dance of savory delight",
    "sources": "Egg - Salad",
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.3",
    "rate_number": "273"
  },
  {
    "id": "2",
    "image": "https://ik.imagekit.io/t2ahazwe2gu/zanzee/images/chickenshawama_Wabz_h478.jpg?updatedAt=1715863132025",
    "is_favorited": false,
    "name": "Greeny Salad",
    "price": "\$8.50",
    "description": "Breakfast aand Brunch - Juice and Smoothies",
    "time": "15-25 Min",
    "delivery_fee": "\$2.49 Delivery Fee",
    "rate": "4.5",
    "rate_number": "22"
  },
  {
    "id": "3",
    "image": "images/chickensuya.jpg",
    "is_favorited": false,
    "price": "\$8.50",
    "name": "Milk Breakfast",
    "description": "Breakfast and Brunch - American - Sandwich",
    "sources": "Egg - Salad",
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.3",
    "rate_number": "273"
  },
  {
    "id": "3",
    "image": "images/pepper-soup-goat-meat.jpeg",
    "is_favorited": false,
    "price": "\$6.90",
    "name": "Freshy Salmon",
    "description": "Breakfast and Brunch - Juice and Smoothies",
    "time": "15-25 Min",
    "delivery_fee": "\$2.49 Delivery Fee",
    "rate": "4.4",
    "rate_number": "22"
  },
];

List categories = [
  {"name": "all", "icon": FontAwesomeIcons.tableCells},
  {"name": "food", "icon": FontAwesomeIcons.cloudMeatball},
  {"name": "drinks", "icon": FontAwesomeIcons.wineBottle},
  {"name": "soup", "icon": Icons.rice_bowl},
  {"name": "beer", "icon": FontAwesomeIcons.beerMugEmpty},
  {"name": "wine", "icon": FontAwesomeIcons.wineGlass},
  {"name": "small Chops", "icon": FontAwesomeIcons.cookie},
  {"name": "spirits", "icon": FontAwesomeIcons.wineGlassEmpty},
  {"name": "biters", "icon": FontAwesomeIcons.prescriptionBottle},
  {"name": "snacks", "icon": FontAwesomeIcons.hotdog},
  {"name": "juice", "icon": Icons.local_drink},
];

const List featured = [
  {
    "id": "1",
    "image":
        "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_favorited": true,
    "price": "\$18.75",
    "name": "Mix Pizza",
    "description": "Breakfast and Brunch - American - Sandwich",
    "sources": "Egg - Salad",
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.3",
    "rate_number": "273"
  },
  {
    "id": "2",
    "image":
        "https://images.unsplash.com/photo-1543339308-43e59d6b73a6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$12.50",
    "is_favorited": false,
    "name": "Greeny Salad",
    "description": "Breakfast and Brunch - American - Sandwich",
    "sources": "Egg - Salad",
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.8",
    "rate_number": "273"
  },
  {
    "id": "3",
    "image":
        "https://images.unsplash.com/photo-1511909525232-61113c912358?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "is_favorited": false,
    "name": "Greeny Salad",
    "price": "\$15.25",
    "description": "Breakfast and Brunch - American - Sandwich",
    "sources": "Egg - Salad",
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.3",
    "rate_number": "273"
  },
  {
    "id": "4",
    "image":
        "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "price": "\$5.50",
    "name": "Greeny Salad",
    "description": "Breakfast and Brunch - American - Sandwich",
    "sources": "Egg - Salad",
    "is_favorited": true,
    "delivery_fee": "\$1.49 Delivery Fee",
    "rate": "4.5",
    "rate_number": "273"
  },
];

const List<Map<String, dynamic>> menu = [
  {
    "id": "1",
    "name": "budweiser \n(King Of Beers)",
    "price": 2000,
    "description":
        "refreshing and crisp, a chilled Budweiser awaits. As you pop the cap, a cascade of cool, golden goodness beckons, promising pure satisfaction with every sip.",
    "tags": ["drinks", "beer", "alcohol"],
    "delivery_fee": "free",
    "is_favorited": true,
    "image": "images/Budweiser.jpg",
    "options": ["cold", "room temp"],
    "extras": [],
    "cutleries": ["cup", "spoons", "fork"],
    "sources": "drinks",
  },
  {
    "id": "2",
    "name": "heineken",
    "price": 2000,
    "description":
        "refreshing and crisp, a chilled Heineken awaits. As you pop the cap, a cascade of cool, golden goodness beckons, promising pure satisfaction with every sip.",
    "tags": ["drinks", "beer", "alcohol"],
    "delivery_fee": "free",
    "is_favorited": true,
    "image": "images/heineken.jpg",
    "options": ["cold", "room temp"],
    "extras": [],
    "cutleries": [],
    "sources": "drinks",
  },
  {
    "id": "3",
    "name": "pepper Soup \n(Goat Meat)",
    "price": 2000,
    "description":
        "savor the aroma as a steaming plate of succulent goat meat pepper soup arrives, its tantalizing spices promising a fiery delight with every spoonfu",
    "tags": ["food", "soup", "goat", "meat"],
    "delivery_fee": "free",
    "is_favorited": true,
    "image": "images/pepper-soup-goat-meat.jpeg",
    "options": ["spicy", "classic"],
    "extras": [
      {"item": "Coke", "price": 600},
      {"item": "budwiser", "price": 1800},
      {"item": "chi Exotic", "price": 1800},
      {"item": "holandia", "price": 1800}
    ],
    "cutleries": ["cup", "spoons", "fork"],
    "sources": "food"
  }
];
