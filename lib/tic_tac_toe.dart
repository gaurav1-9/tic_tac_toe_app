import 'package:flutter/material.dart';

import './appProperties/app_colors.dart';

enum IsTapped {
  initialState,
  xTurn,
  oTurn,
}

enum WinnerStatus {
  noWinner,
  winner,
  draw,
}

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  IsTapped isXTurn = IsTapped.initialState;
  List<String> gridValue = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int gridFilled = 0;
  WinnerStatus winnerCondition = WinnerStatus.noWinner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.raisinBlack,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: AppColor.raisinBlack,
        title: Center(
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            decoration: const BoxDecoration(
              color: AppColor.jet,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Text(
              "Tic Tac Toe",
              style: TextStyle(
                color: AppColor.white,
                fontSize: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext ctx, int index) {
              return GestureDetector(
                onTap: () {
                  _tapped(index);
                },
                child: Center(
                  child: Container(
                    height: (MediaQuery.of(context).size.width / 3) - 20,
                    width: (MediaQuery.of(context).size.width / 3) - 20,
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: AppColor.jet,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        gridValue[index],
                        style: TextStyle(
                          color: AppColor.white.withOpacity(0.4),
                          fontSize: 70,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if ((isXTurn == IsTapped.initialState || isXTurn == IsTapped.xTurn) &&
          gridValue[index].isEmpty) {
        gridValue[index] = 'X';
        isXTurn = IsTapped.oTurn;
        gridFilled++;
      }
      if (isXTurn == IsTapped.oTurn && gridValue[index].isEmpty) {
        gridValue[index] = '0';
        isXTurn = IsTapped.xTurn;
        gridFilled++;
      }
    });
    _checkWinner();
  }

  void _checkWinner() {
    if (gridValue[0] == gridValue[1] &&
        gridValue[2] == gridValue[0] &&
        gridValue[0] != '' &&
        gridValue[1] != '' &&
        gridValue[2] != '') {
      winnerCondition = WinnerStatus.winner;
    }
    if (gridValue[3] == gridValue[4] &&
        gridValue[5] == gridValue[3] &&
        gridValue[3] != '' &&
        gridValue[4] != '' &&
        gridValue[5] != '') {
      winnerCondition = WinnerStatus.winner;
    }
    if (gridValue[6] == gridValue[7] &&
        gridValue[8] == gridValue[6] &&
        gridValue[6] != '' &&
        gridValue[7] != '' &&
        gridValue[8] != '') {
      winnerCondition = WinnerStatus.winner;
    }
    if (gridValue[0] == gridValue[3] &&
        gridValue[6] == gridValue[0] &&
        gridValue[0] != '' &&
        gridValue[3] != '' &&
        gridValue[6] != '') {
      winnerCondition = WinnerStatus.winner;
    }
    if (gridValue[1] == gridValue[4] &&
        gridValue[7] == gridValue[1] &&
        gridValue[1] != '' &&
        gridValue[4] != '' &&
        gridValue[7] != '') {
      winnerCondition = WinnerStatus.winner;
    }
    if (gridValue[2] == gridValue[5] &&
        gridValue[8] == gridValue[2] &&
        gridValue[2] != '' &&
        gridValue[5] != '' &&
        gridValue[8] != '') {
      winnerCondition = WinnerStatus.winner;
    }
    if (gridValue[0] == gridValue[4] &&
        gridValue[8] == gridValue[1] &&
        gridValue[0] != '' &&
        gridValue[4] != '' &&
        gridValue[8] != '') {
      winnerCondition = WinnerStatus.winner;
    }
    if (gridValue[2] == gridValue[4] &&
        gridValue[6] == gridValue[2] &&
        gridValue[2] != '' &&
        gridValue[4] != '' &&
        gridValue[6] != '') {
      winnerCondition = WinnerStatus.winner;
    }
    if (gridFilled == 9) {
      winnerCondition = WinnerStatus.draw;
    }
    if (winnerCondition == WinnerStatus.draw ||
        winnerCondition == WinnerStatus.winner) {
      setState(() {
        for (int i = 0; i < gridValue.length; i++) {
          gridValue[i] = '';
        }
        gridFilled = 0;
        isXTurn = IsTapped.initialState;
        winnerCondition = WinnerStatus.noWinner;
      });
    }
  }
}
