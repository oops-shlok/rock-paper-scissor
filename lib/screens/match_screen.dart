import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_1/screens/main_screen.dart';

import '../widgets/button.dart';

class matchScreen extends StatefulWidget {
  matchScreen(this.gameChoice, {Key? key}) : super(key: key);
  Choice gameChoice;

  @override
  _matchScreenState createState() => _matchScreenState();
}

class Game {
  static List<String> options = ["Rock", "Scissors", "Paper"];
  String? randomChoice() {
    Random random = Random();
    int index = random.nextInt(3);
    return options[index];
  }
}

class Choice {
  String? type = "";
  static var rules = {
    "Rock": {
      "Rock": "It's a draw",
      "Paper": "Player 2 Wins",
      "Scissors": "Player 1 Wins"
    },
    "Paper": {
      "Rock": "Player 1 Wins",
      "Paper": "It's a draw",
      "Scissors": "Player 2 Wins"
    },
    "Scissors": {
      "Rock": "Player 2 Wins",
      "Paper": "Player 1 Wins",
      "Scissors": "It's a draw"
    },
  };
  Choice(this.type);
}

class _matchScreenState extends State<matchScreen> {
  @override
  Widget build(BuildContext context) {
    String? player2 = Game().randomChoice();
    String player2Choice = "";
    switch (player2) {
      case "Rock":
        player2Choice = "assets/rock.png";
        break;
      case "Paper":
        player2Choice = "assets/hand.png";
        break;
      case "Scissors":
        player2Choice = "assets/scissors.png";
        break;
      default:
    }
    String? player1Choice;
    switch (widget.gameChoice.type) {
      case "Rock":
        player1Choice = "assets/rock.png";
        break;
      case "Paper":
        player1Choice = "assets/hand.png";
        break;
      case "Scissors":
        player1Choice = "assets/scissors.png";
        break;
      default:
    }

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
              height: 200,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: "${widget.gameChoice.type}",
                    child: gameButton(
                        null,
                        player1Choice!,
                        MediaQuery.of(context).size.width / 2 - 40,
                        MediaQuery.of(context).size.height / 2),
                  ),
                  const Text(
                    "VS",
                    style: TextStyle(color: Colors.white, fontSize: 26.0),
                  ),
                  gameButton(
                      null,
                      player2Choice,
                      MediaQuery.of(context).size.width / 2 - 40,
                      MediaQuery.of(context).size.height / 2)
                ],
              )),
            ),
            Text(
              "${Choice.rules[widget.gameChoice.type]![player2]}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ));
                },
                padding: const EdgeInsets.symmetric(),
                shape: const StadiumBorder(
                    side: BorderSide(color: Colors.white, width: 3.0)),
                child: const Text(
                  "Play Again",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
