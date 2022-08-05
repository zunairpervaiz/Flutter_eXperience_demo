import 'package:demo_application/const/colors.dart';
import 'package:demo_application/const/images.dart';
import 'package:demo_application/const/strings.dart';
import 'package:demo_application/views/pitch_screen.dart';
import 'package:demo_application/widgets/carousel.dart';
import 'package:demo_application/widgets/team_card.dart';
import 'package:demo_application/widgets/text_styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: gradientTop));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(),
      title: appname,
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  var team1 = ["AME", "JAG", "ALZ", "BUC", "CHI"];
  var team2 = ["CHI", "AME", "BUC", "JAG", "ALZ"];
  var games = ["M1 | All Games", "M1 | Al-Ahly vs Misr Lel Makkasa", "M1 | Single Match"];
  var booking = ["24 of 30 Seats", "null", "9 of 40 Seats"];
  var isActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  children: [
                    Image.asset(accountImage),
                    Expanded(child: Image.asset(brand)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            customText(text: matchday, size: 14),
                            customText(text: date, size: 14),
                          ]),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            color: darkGrey,
                            height: 44,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 15,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isActiveIndex = index;
                                        team1.shuffle();
                                        team2.shuffle();
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                      margin: const EdgeInsets.only(right: 8),
                                      color: isActiveIndex == index ? Colors.black : lightGrey,
                                      child: Text(
                                        "${index + 1}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: isActiveIndex == index ? Colors.white : Colors.black),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            height: 120,
                            width: double.infinity,
                            child: RawScrollbar(
                              thickness: 3,
                              thumbColor: Colors.black,
                              thumbVisibility: true,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    color: Colors.white,
                                    margin: const EdgeInsets.only(right: 12),
                                    child: teamCard(team1[index], team2[index]),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      margin: const EdgeInsets.only(top: 10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          carousel(),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customText(size: 20, text: gamecontest),
                              customText(size: 16, text: viewall),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: lightGrey,
                                ),
                                margin: const EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(flag),
                                                const SizedBox(width: 4),
                                                customText(text: games[index], size: 18),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            customText(text: fee, size: 14),
                                            customText(text: prize, size: 14),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            index == 1
                                                ? const Text(
                                                    sold,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: gradientBottom,
                                                        fontWeight: FontWeight.w600),
                                                  )
                                                : Text(
                                                    booking[index],
                                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: green, padding: const EdgeInsets.symmetric(horizontal: 24)),
                                              onPressed: index == 1
                                                  ? null
                                                  : () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: ((context) => const PitchScreen())));
                                                    },
                                              child: const Text(join, style: TextStyle(fontWeight: FontWeight.bold)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: index == 1
                                          ? null
                                          : () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: ((context) => const PitchScreen())));
                                            },
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        padding: const EdgeInsets.all(8),
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        color: darkGrey,
                                        child: customText(text: viewMore),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(medal),
                  const CircleAvatar(
                      backgroundColor: gradientTop,
                      child: Text(
                        "FT",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  Image.asset(ticket),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
