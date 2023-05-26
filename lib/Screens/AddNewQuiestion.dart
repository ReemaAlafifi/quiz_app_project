import 'package:flutter/material.dart';
import 'package:quiz_app_project/Screens/CreatQuizScreen.dart';
import 'package:quiz_app_project/sqldb.dart';

class AddNewQuestion extends StatefulWidget {
  const AddNewQuestion({super.key});

  @override
  State<AddNewQuestion> createState() => _AddNewQuestionState();
}

class _AddNewQuestionState extends State<AddNewQuestion> {
  List<String> dataList = [
    'Question',
    'First Answer',
    'Second Answer',
    'Third Answer',
    'Fourth Anwer',
  ];

  late GlobalKey<FormState> _gloableKey;
  late TextEditingController questionController;
  late TextEditingController firstAnswerController;
  late TextEditingController secoundAnswerController;
  late TextEditingController thirdAnswerController;
  late TextEditingController fourthAnswerController;

  SqlDb sql = SqlDb();

  List<String> value = <String>['A', 'B', 'C', 'D'];

  String? dropdownValue;

  @override
  void initState() {
    _gloableKey = GlobalKey();
    questionController = TextEditingController();
    firstAnswerController = TextEditingController();
    secoundAnswerController = TextEditingController();
    thirdAnswerController = TextEditingController();
    fourthAnswerController = TextEditingController();
    super.initState();

    // questionController.text = 'Question';
    // firstAnswerController.text = 'First Answer';
    // secoundAnswerController.text = 'Secound Answer';
    // thirdAnswerController.text = 'Third Answer';
    // fourthAnswerController.text = 'ThrthFouird Answer';
  }

  @override
  void dispose() {
    _gloableKey.currentState!.dispose();
    questionController.dispose();
    firstAnswerController.dispose();
    secoundAnswerController.dispose();
    thirdAnswerController.dispose();
    fourthAnswerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          iconSize: 30,
        ),
        centerTitle: true,
        title: Text(
          'Add new  question',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: _gloableKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                TextFormField(
                  controller: questionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.blue.shade900),
                    ),
                    prefixIcon: Icon(Icons.question_mark_sharp),
                    labelText: 'Question',
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your question';
                    }
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                Row(children: [
                  CircleAvatar(
                    radius: 22,
                    child: Text(
                      'A',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    backgroundColor: Colors.amber,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                        controller: firstAnswerController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue.shade900),
                          ),
                          labelText: 'First Answer',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your question';
                          }
                        }),
                  ),
                ]),

                // /////////////////////////////////////////////////////////////////////////////////////////
                SizedBox(
                  height: 8,
                ),
                Row(children: [
                  CircleAvatar(
                    radius: 22,
                    child: Text(
                      'B',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                        controller: secoundAnswerController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue.shade900),
                          ),
                          labelText: 'Second Answer',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your question';
                          }
                        }),
                  ),
                ]),
                // /////////////////////////////////////////////////

                SizedBox(
                  height: 8,
                ),
                Row(children: [
                  CircleAvatar(
                    radius: 22,
                    child: Text(
                      'C',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    backgroundColor: Colors.grey.shade600,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                        controller: thirdAnswerController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.blue.shade900),
                          ),
                          labelText: 'Third Answer',
                          hintStyle: TextStyle(fontSize: 20),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your question';
                          }
                        }),
                  ),
                ]),

                // //////////////////////////////////////////////

                SizedBox(
                  height: 8,
                ),
                Row(children: [
                  CircleAvatar(
                    radius: 22,
                    child: Text(
                      'D',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    backgroundColor: Colors.pink,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: fourthAnswerController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.blue.shade900),
                        ),
                        labelText: 'Fourth Answer',
                        hintStyle: TextStyle(fontSize: 20),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your question';
                        }
                      },
                    ),
                  ),
                ]),

                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.only(end: 10),
                      child: Text('Select the correct answer',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                          )),
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        style: TextStyle(
                          color: Colors.green.shade500,
                          fontSize: 20,
                        ),
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          width: 5,
                          color: Colors.black12,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value;
                            print('Correct: $dropdownValue');
                          });
                        },
                        items:
                            value.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 35,
                ),

                ElevatedButton(
                  onPressed: () => addNewQuestion(),
                  child: Text('Add question'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    textStyle: TextStyle(fontSize: 20),
                    fixedSize: Size(375, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void addNewQuestion() {
    print('QUESTION: ${questionController.text}');
    print('FIRST: ${firstAnswerController.text}');
    print('SECOUND: ${secoundAnswerController.text}');
    print('THIRD: ${thirdAnswerController.text}');
    print('FOURTH: ${fourthAnswerController.text}');
    bool isValid = _gloableKey.currentState!.validate();
    // print('Enter ${isValid}');
    // if (isValid) {

    if (isValid) {}

    String correctAnswer = '';
    if (dropdownValue == 'A') {
      correctAnswer = firstAnswerController.text;
    } else if (dropdownValue == 'B') {
      correctAnswer = secoundAnswerController.text;
    } else if (dropdownValue == 'C') {
      correctAnswer = thirdAnswerController.text;
    } else if (dropdownValue == 'D') {
      correctAnswer = fourthAnswerController.text;
    }

    print('Correct Answer: $correctAnswer');
    if (

    isValid

    /*questionController.text.isNotEmpty &&
        firstAnswerController.text .isNotEmpty&&
        secoundAnswerController.text.isNotEmpty &&
        thirdAnswerController.text.isNotEmpty &&
        correctAnswer.isNotEmpty&&
        fourthAnswerController.text.isNotEmpty*/) {
      sql
          .insertData(
          questionController.text,
          firstAnswerController.text,
          secoundAnswerController.text,
          thirdAnswerController.text,
          fourthAnswerController.text,
          correctAnswer)
          .then((response) {
        if (response != null) {
          if (response > 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (conext) => CreatQuiz()));
            print('RESPONSE: $response');
            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>CreatQuiz()), (route) => false);
          }
        }
        if (value.isEmpty) {
          Navigator.of(context).pop();
        }
      });
    }else{
      print("123456789fhdujd");
    }


    // int response= await sql.insertData ("INSERT INTO 'questions' ('question') VALUES ('question one')");
    // Navigator.push(context, MaterialPageRoute(builder: (c) => CreatQuiz()));
    // } else {
    //   print('Enter data');
    // }
  }
}
