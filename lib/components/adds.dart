import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

buildAdsImage() {
  return CarouselSlider.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
                ),
              ),
            ),
          ),
      options: CarouselOptions(viewportFraction: 1, autoPlay: true));
}
