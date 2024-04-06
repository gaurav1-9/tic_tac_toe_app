import 'package:flutter/material.dart';

import './appProperties/app_colors.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  bool isXTurn = true;
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
              return Center(
                child: Container(
                  height: 110,
                  width: 110,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: AppColor.jet,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      index.toString(),
                      style: TextStyle(
                        color: (!isXTurn)
                            ? AppColor.white.withOpacity(0.4)
                            : AppColor.red.withOpacity(0.6),
                        fontSize: 70,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
