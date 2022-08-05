import 'package:demo_application/const/colors.dart';
import 'package:demo_application/const/images.dart';
import 'package:demo_application/const/strings.dart';
import 'package:demo_application/widgets/first_alignment.dart';

import 'package:demo_application/widgets/second_alignment.dart';
import 'package:demo_application/widgets/text_styling.dart';
import 'package:flutter/material.dart';

import '../widgets/player.dart';
import '../widgets/third_alignment.dart';

class PitchScreen extends StatefulWidget {
  const PitchScreen({Key? key}) : super(key: key);

  @override
  State<PitchScreen> createState() => _PitchScreenState();
}

class _PitchScreenState extends State<PitchScreen> {
  var isVisible = false;
  int categoryIndex = 0;
  List<String> listOfCategory = ['5-3-2', '4-3-3', '4-4-2'];
  var selectedIndexCategory = "5-3-2";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 56,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    gradientTop,
                    gradientBottom,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        back,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Text(
                      version,
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      continueText,
                      style: TextStyle(color: darkRed, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [Image.asset(flag), const SizedBox(width: 4), underlineText(size: 16, text: "League")],
                  ),
                  underlineText(size: 16, text: "M1 | All Matches"),
                  underlineText(text: "Information", size: 16),
                ],
              ),
            ),
            Container(
              color: lightGrey,
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText(size: 14, text: "Prize: 20 Points"),
                  customText(size: 14, text: "Close at: 20:00h"),
                  customText(text: seats, size: 14),
                ],
              ),
            ),
            Container(
              height: size.height * 0.70,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    darkGreen,
                    lightGreen,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/group.png"), fit: BoxFit.fill),
                    ),
                    child: Stack(
                      children: [
                        categoryIndex == 0
                            ? firstAlignment(size, isVisible)
                            : categoryIndex == 1
                                ? secondAlignment(size, isVisible)
                                : thirdAlignment(size, isVisible),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: size.height * 0.001,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    1,
                                    (index) => const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Player(),
                                        )).toList()),
                          ),
                        ),
                        Positioned(
                          bottom: size.height * 0.07,
                          left: size.width * 0.1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            width: 100,
                            height: 45,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: DropdownButton(
                              dropdownColor: lightGreen,
                              icon: Container(),
                              value: selectedIndexCategory,
                              underline: const SizedBox(height: 0),
                              onChanged: (dynamic newValue) {
                                setState(() {
                                  selectedIndexCategory = newValue;
                                  categoryIndex = listOfCategory.indexOf(newValue);
                                });
                              },
                              items: listOfCategory.map((category) {
                                return DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset("assets/ale.png"),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
