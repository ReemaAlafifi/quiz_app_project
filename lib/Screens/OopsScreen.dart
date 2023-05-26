import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(const OopsScreen());
}

class OopsScreen extends StatelessWidget {
  const OopsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz app'),
          centerTitle: true,
          //elevation:10,
          titleSpacing: 16,
          leading: IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(150),
            child: Column(
              children: [
                Text(
                  "Oops!",
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 15, 185, 185)),
                ),
                SizedBox(
                  height: 30,
                ),
                   Image.asset(
              'assets/images/fail.png',
              height: 300,
              width: 300,
            ),
              
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your Score : 1/10",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 10, 163, 48)),
                ),
                Text("Sorry ,better luck next time !",
                    style: const TextStyle(fontSize: 20, color: Colors.black)),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 16, 135, 156),
                    minimumSize: Size(200, 50),
                  ),
                  child: Text(
                    'Back to Home',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}