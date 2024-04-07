import 'package:flutter/material.dart';

import '../tic_tac_toe.dart';
import '../appProperties/app_colors.dart';

class PlayerTurnInfo extends StatelessWidget {
  final IsTapped playerTurn;
  const PlayerTurnInfo({
    super.key,
    required this.playerTurn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Column(
          children: [
            Text(
              "PLAYER",
              style: TextStyle(
                color: AppColor.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "T",
                  style: TextStyle(
                    color: AppColor.white,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "URN",
                  style: TextStyle(
                    color: AppColor.white,
                    letterSpacing: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Text(
          ":",
          style: TextStyle(
            color: AppColor.white,
            fontSize: 25,
          ),
        ),
        Text(
          (playerTurn == IsTapped.xTurn || playerTurn == IsTapped.initialState)
              ? "X"
              : "O",
          style: TextStyle(
            color: (playerTurn == IsTapped.xTurn ||
                    playerTurn == IsTapped.initialState)
                ? AppColor.white.withOpacity(0.4)
                : AppColor.red.withOpacity(0.6),
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
