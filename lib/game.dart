// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

class TicTacToeGame extends StatefulWidget {
  const TicTacToeGame({Key? key}) : super(key: key);

  @override
  State<TicTacToeGame> createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  final Matrix3 _dataMatrix = Matrix3.fromList(List.generate(9, (index) => -1));

  String _currentPlayer = 'O';
  int _filledPositions = 0;

  String _winner = '';

  @override
  void initState() {
    super.initState();
  }

  _makeMove(int row, int col) {
    if (_dataMatrix.entry(row, col) != -1 || _winner != '') {
      return;
    }
    final double value = _currentPlayer == 'O' ? 0 : 1;
    setState(() {
      _dataMatrix.setEntry(row, col, value);
      _currentPlayer == 'O' ? _currentPlayer = 'X' : _currentPlayer = 'O';
    });

    if (_filledPositions < 9) {
      setState(() {
        _filledPositions++;
        _winner = _checkWinner(row, col);
      });

      if (_winner.isNotEmpty) {
        print("Winner is: $_winner");
      }
    } else {
      print("Draw!");
    }
  }

  String _checkWinner(int row, int col) {
    String winner = '';

    final _row = _dataMatrix.getRow(row);
    winner = _checkCombination(_row);
    if (winner.isNotEmpty) {
      return winner;
    }

    final _col = _dataMatrix.getColumn(col);
    winner = _checkCombination(_col);
    if (winner.isNotEmpty) {
      return winner;
    }

    final _diag1 = Vector3.array([
      _dataMatrix.entry(0, 0),
      _dataMatrix.entry(1, 1),
      _dataMatrix.entry(2, 2)
    ]);

    winner = _checkCombination(_diag1);
    if (winner.isNotEmpty) {
      return winner;
    }

    final _diag2 = Vector3.array([
      _dataMatrix.entry(0, 2),
      _dataMatrix.entry(1, 1),
      _dataMatrix.entry(2, 0)
    ]);
    winner = _checkCombination(_diag2);
    return winner;
  }

  String _checkCombination(Vector3 vector) {
    if (vector == Vector3.zero()) {
      return 'O';
    } else if (vector == Vector3.all(1)) {
      return 'X';
    } else {
      return '';
    }
  }

  String label(int row, int col) {
    final entry = _dataMatrix.entry(row, col);

    if (entry == 1) {
      return 'X';
    } else if (entry == 0) {
      return 'O';
    } else {
      return '';
    }
  }

  Widget getCell(int row, int col) => InkWell(
        onTap: () {
          _makeMove(row, col);
        },
        child: Container(
          height: 80,
          width: 80,
          margin: const EdgeInsets.all(2.0),
          color: Colors.green[100],
          child: Center(
              child: Text(
            label(row, col),
            style: Theme.of(context).textTheme.headline2,
          )),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getCell(0, 0),
              getCell(0, 1),
              getCell(0, 2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getCell(1, 0),
              getCell(1, 1),
              getCell(1, 2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getCell(2, 0),
              getCell(2, 1),
              getCell(2, 2),
            ],
          ),
        ],
      ),
    );
  }
}
