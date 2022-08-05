import 'package:demo_application/const/colors.dart';
import 'package:demo_application/const/images.dart';
import 'package:demo_application/widgets/text_styling.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  var isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          child: Image.asset(
            isVisible ? shirtColor : shirtWhite,
          ),
        ),
        isVisible ? customText(text: "M.Magdy", size: 14) : Container(),
        isVisible
            ? Row(
                children: [
                  Container(
                    width: 22,
                    height: 14,
                    color: yellowColor,
                    alignment: Alignment.center,
                    child: customText(text: "-"),
                  ),
                  const SizedBox(width: 4),
                  customText(text: "29.9M"),
                ],
              )
            : Container()
      ],
    );
  }
}
