import 'package:demo_application/widgets/player.dart';
import 'package:flutter/material.dart';

Widget secondAlignment(size, isVisible) {
  return Stack(
    children: [
      Positioned(
        left: 0,
        right: 0,
        top: size.height * 0.03,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                      3,
                      (index) =>
                          const Padding(padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16), child: Player()))
                  .toList()),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        top: size.height * 0.18,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                      3,
                      (index) =>
                          const Padding(padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24), child: Player()))
                  .toList()),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        top: size.height * 0.36,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                      2,
                      (index) =>
                          const Padding(padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24), child: Player()))
                  .toList()),
        ),
      ),
      Positioned(
        left: size.width * 0.12,
        right: size.width * 0.12,
        top: size.height * 0.32,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  List.generate(2, (index) => const Padding(padding: EdgeInsets.all(12.0), child: Player())).toList()),
        ),
      ),
    ],
  );
}
