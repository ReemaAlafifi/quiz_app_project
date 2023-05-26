import 'package:flutter/material.dart';
import 'package:quiz_app_project/Screens/StartQuiz.dart';
import 'package:quiz_app_project/sqldb.dart';

import 'CreatQuizScreen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  SqlDb sql = SqlDb();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sql.intialDb();

    // sql.insertData('First Test');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(
          'Quiz app',
        ),
      ),
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.shade300,
                  radius: 40,
                  child: Text(
                    'R',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
                SizedBox(height: 10),
                Text('Reema Alafifi'),
                SizedBox(
                  height: 7,
                ),
                Text('reema.afifi.19@gmail.com'),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              print(Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatQuiz()),
              ));
            },
            leading: Icon(Icons.edit),
            title: Text(
              "Craet Quiz ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/StartQuiz'),
            leading: Icon(Icons.question_mark_rounded),
            title: Text(
              "Start Quiz ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(thickness: 1),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              "Exit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
        backgroundColor: Colors.white,
      ),
      body:
       Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/quiz.png',
              height: 300,
              width: 300,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => StartQuiz())),
              child: Text('Lets Start!'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  textStyle: TextStyle(fontSize: 20),
                  fixedSize: Size(200, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
          
          ],
        ),
      ),
  
    );
  }
}
