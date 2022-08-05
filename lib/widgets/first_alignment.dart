import 'package:demo_application/widgets/player.dart';
import 'package:flutter/material.dart';

Widget firstAlignment(size, isVisible) {
  return Stack(
    children: [
      Positioned(
        left: 0,
        right: 0,
        top: size.height * 0.03,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  2,
                  (index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
                        child: Player(),
                      )).toList()),
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
                  (index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
                        child: Player(),
                      )).toList()),
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
                  3,
                  (index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
                        child: Player(),
                      )).toList()),
        ),
      ),
      Positioned(
        left: size.width * 0.06,
        right: size.width * 0.06,
        top: size.height * 0.32,
        child: Align(
          alignment: Alignment.topCenter,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  2,
                  (index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                        child: Player(),
                      )).toList()),
        ),
      ),
    ],
  );
}
