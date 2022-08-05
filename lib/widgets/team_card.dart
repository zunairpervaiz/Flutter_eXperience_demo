import 'package:demo_application/const/colors.dart';
import 'package:demo_application/widgets/text_styling.dart';
import 'package:flutter/material.dart';

Widget teamCard(team1, team2) {
  return Column(
    children: [
      SizedBox(
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.black,
                ),
                const SizedBox(
                  height: 6,
                ),
                customText(text: team1, size: 14),
              ],
            ),
            const SizedBox(
              width: 6,
            ),
            customText(text: "VS", size: 10),
            const SizedBox(
              width: 6,
            ),
            Column(
              children: [
                const CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.black,
                ),
                const SizedBox(
                  height: 6,
                ),
                customText(text: team2, size: 14),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 6,
      ),
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(6),
          ),
          color: darkGrey,
        ),
        width: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(text: "0", size: 14),
              customText(text: "0", size: 14),
            ],
          ),
        ),
      ),
    ],
  );
}
