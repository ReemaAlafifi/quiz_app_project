import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_app_project/sqldb.dart';

import 'AddNewQuiestion.dart';

class CreatQuiz extends StatefulWidget {
  const CreatQuiz({super.key});

  @override
  State<CreatQuiz> createState() => _CreatQuizState();
}

class _CreatQuizState extends State<CreatQuiz> {
  SqlDb sql = SqlDb();
  List queations = [];
 
  @override
  void initState() {
    super.initState();
    readAllQuestions();
  }

  bool isLoading = false;

  void readAllQuestions() async {
    await sql.readData()
    .then((value) {



      if(value != null){
        // print('QUESTIONS: $value');
        isLoading = false;
        if (this.mounted) {
          setState(() {
            queations.clear();
            queations.addAll(value);
            print('QUESTIONS: ${queations.length}');
          });
        }
      }
    });
  }

  void deleteQuestion(int questionId) {
    setState(() {
      sql.deleteData(questionId)
          .then((value) {
        if(value != null){
          readAllQuestions();
          Navigator.pop(context);
          print('VAL: $value');
        }
      });
    });
  }

  void _showAlertDialog(BuildContext context, int id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete querstion'),
            content: Text('Are you sure you want to delete \n this question?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'cancel',
                    style: TextStyle(fontSize: 20),
                  )),
              TextButton(
                  onPressed: () => deleteQuestion(id),
                  child: Text(
                    'delete',
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Creat Quiz',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
            children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  textStyle: TextStyle(fontSize: 20),
                  fixedSize: Size(370, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => AddNewQuestion()));
                },
                icon: Icon(
                  Icons.add,
                  size: 20,
                ),
                label: Text(
                  'Add new question',
                ),
              ),
            ),
          ),
          ///////////////////////////////////////////////////////////////////// //
          ListView.builder(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: queations.length,
              itemBuilder: (context, index) => buildQuestionsItem(queations[index]))
        ]),
      ),
    );
  }

  Widget buildQuestionsItem(Map<String, dynamic> queation) => Container(
    margin: EdgeInsetsDirectional.only(top: 4, bottom: 4, start: 10, end: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      boxShadow: [BoxShadow(color: Colors.grey.shade200)],
    ),
    height: 330,
    width: 350,
    child: Column(children: [
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(23),
              child: Text(
                '${queation['question']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(end: 20),
            child: IconButton(
              onPressed: () async {
                _showAlertDialog(context, queation['id']);
                // int response= await sql.deleteData("DELETE FROM 'questions' WHERE id = ${dart![i]['question']}");
                // print("$response");
              },
              icon: Icon(Icons.delete),
              iconSize: 30,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        height: 50,
        width: 320,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            '${queation['FirstAnswer']}',
            style: TextStyle(
              fontSize: 20,
              color: queation['FirstAnswer'] == queation['CorrectAnswer'] ? Colors.white : Colors.black,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: queation['FirstAnswer'] == queation['CorrectAnswer'] ? Colors.green : Colors.white,
        ),
      ),
      SizedBox(
        height: 9,
      ),
      Container(
        height: 50,
        width: 320,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            '${queation['SecondAnswer']}',
            style: TextStyle(
              fontSize: 20,
              color: queation['SecondAnswer'] == queation['CorrectAnswer'] ? Colors.white : Colors.black,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: queation['SecondAnswer'] == queation['CorrectAnswer'] ? Colors.green : Colors.white,
        ),
      ),
      SizedBox(
        height: 9,
      ),
      Container(
        height: 45,
        width: 320,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            '${queation['ThirdAnswer']}',
            style: TextStyle(
              fontSize: 20,
              color: queation['ThirdAnswer'] == queation['CorrectAnswer'] ? Colors.white : Colors.black,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: queation['ThirdAnswer'] == queation['CorrectAnswer'] ? Colors.green : Colors.white,
        ),
      ),
      SizedBox(
        height: 9,
      ),
      Container(
        height: 45,
        width: 320,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            '${queation['FourthAnswer']}',
            style: TextStyle(
              fontSize: 20,
              color: queation['FourthAnswer'] == queation['CorrectAnswer'] ? Colors.white : Colors.black,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: queation['FourthAnswer'] == queation['CorrectAnswer'] ? Colors.green : Colors.white,
        ),
      ),
    ]),
  );

  Widget buildItem() => Center(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sorry!",
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 15, 185, 185)),
          ),
          SizedBox(
            height: 20,
          ),
          Text('You must add at least 5 question to start',
              style: const TextStyle(fontSize: 18, color: Colors.black)),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 250,
            child: Image.asset(
              'assets/images/faq.png',
              fit: BoxFit.contain,
            ),
          ),
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
  );
}
