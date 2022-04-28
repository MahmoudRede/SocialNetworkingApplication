
import 'package:final_project/modules/BotScreen/botDesign.dart';
import 'package:final_project/modules/BotScreen/hintScreen.dart';
import 'package:flutter/material.dart';

class BotContainer extends StatelessWidget {
  const BotContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BotDesign(),
          HintScreen(),
        ],
      ),
    );
  }
}
