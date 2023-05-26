import 'dart:io';
import 'package:flutter/material.dart';

class CongScreen extends StatelessWidget {

  int? score;
  int? total;
  dynamic? middleTotal ;

   CongScreen({this.score, this.total , this.middleTotal});
  @override
  Widget build(BuildContext context) {
    print('SCORE: $score');
    print('TOTAL: $total');
    print('TOTAL: $middleTotal');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Quiz app'),
        centerTitle: true,
        //elevation:10,
        titleSpacing: 16,
        leading: IconButton(onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
    iconSize: 23),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                score! >=middleTotal? "Congratulations" : "Oops!",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 15, 185, 185)),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 150,

                child: Image.asset(
                  score! >=middleTotal ? "assets/images/result.jpg" : 'assets/images/fail.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Your Score : $score / $total",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 163, 48)),
              ),
              Text(message(score!),
                  style: const TextStyle(fontSize: 20, color: Colors.black)),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/HomePageScreen'),
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
    );
  }

  String message(int score){
    if( score==middleTotal){
      return "Keep up the good work !";
    }else if( score! >middleTotal){
      return "You're Superstart !";
    }else {
      return "Soory, better luck next time!";
    }
  }
}