import 'package:demo_application/const/colors.dart';
import 'package:flutter/material.dart';

Widget carousel() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: lightGrey,
      ),
      height: 120,
      child: PageView.builder(
          itemCount: 3,
          itemBuilder: ((context, index) {
            return Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        3,
                        (i) => Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: i == index ? darkGrey : darkGrey.withOpacity(0.6),
                              ),
                            )),
                  ),
                ),
              ],
            );
          })),
    ),
  );
}
