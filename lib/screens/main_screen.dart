// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:task_1/screens/match_screen.dart';
import 'package:task_1/widgets/button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "ROCK PAPER SCISSORS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2 + 100,
              child: Center(
                  child: Stack(
                children: [
                  Positioned(
                    top: -50,
                    left: -50,
                    child: Hero(
                      tag: "Rock",
                      child: gameButton(() {
                        print("Player 1 chose Rock");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => matchScreen(Choice("Rock")),
                            ));
                      },
                          "assets/rock.png",
                          MediaQuery.of(context).size.width / 2,
                          MediaQuery.of(context).size.height / 4),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.width / 2 - 120,
                    left: -50,
                    child: Hero(
                      tag: "Scissors",
                      child: gameButton(() {
                        print("Player 1 chose Scissors");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  matchScreen(Choice("Scissors")),
                            ));
                      },
                          "assets/scissors.png",
                          MediaQuery.of(context).size.width / 2,
                          MediaQuery.of(context).size.height / 4),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.width / 2,
                    left: -55,
                    child: Hero(
                      tag: "Paper",
                      child: gameButton(() {
                        print("Player 1 chose Paper");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  matchScreen(Choice("Paper")),
                            ));
                      },
                          "assets/hand.png",
                          MediaQuery.of(context).size.width / 2,
                          MediaQuery.of(context).size.height / 4),
                    ),
                  ),
                  Positioned(
                    top: -30,
                    left: 130,
                    child: gameButton(
                        () {},
                        "assets/vs.png",
                        MediaQuery.of(context).size.width / 4,
                        MediaQuery.of(context).size.height / 2),
                  ),
                  Positioned(
                    top: -50,
                    right: -40,
                    child: Hero(
                      tag: "Rock2",
                      child: gameButton(() {
                        print("Player 2 chose Rock");
                      },
                          "assets/rock.png",
                          MediaQuery.of(context).size.width / 2,
                          MediaQuery.of(context).size.height / 4),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.width / 2 - 120,
                    right: -50,
                    child: Hero(
                      tag: "Scissors2",
                      child: gameButton(() {
                        print("Player 2 chose Scissors");
                      },
                          "assets/scissors.png",
                          MediaQuery.of(context).size.width / 2,
                          MediaQuery.of(context).size.height / 4),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.width / 2,
                    right: -50,
                    child: Hero(
                      tag: "Paper2",
                      child: gameButton(() {
                        print("Player 2 chose Paper");
                      },
                          "assets/hand.png",
                          MediaQuery.of(context).size.width / 2,
                          MediaQuery.of(context).size.height / 4 + 10),
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
