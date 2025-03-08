import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roll_dice_app/styled_text.dart';

var randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {

  int randomDice = 2;

  void rollDice() {

    setState(() {
      randomDice = (1 + randomizer.nextInt(6));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/dice-$randomDice.png', width: 200, height: 200),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: rollDice,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
          child: StyledText('Roll Dice'),
        ),
      ],
    );
  }
}
