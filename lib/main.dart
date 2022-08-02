import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: const Text("Tic Tac Toe",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.amber,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700)),
          alignment: Alignment.center,
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/sp_logo.png', height: 100, width: 200),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 50),
            child: const Text("Welcome Tic Tac Toe Spice money",
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.teal,
                    fontWeight: FontWeight.w500,
                    fontSize: 32)),
          ),
        ],
      )),
    );
  }
}

void drawMatrix(int row, int col) {
  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      print("$j ");
    }
    print("\n");
  }
}
