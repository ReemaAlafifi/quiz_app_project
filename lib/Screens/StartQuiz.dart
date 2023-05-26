import 'package:flutter/material.dart';
import 'package:quiz_app_project/Screens/congratulation.dart';

import '../sqldb.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({super.key});

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  late final PageController pageController;
   SqlDb sql = SqlDb();
   List queations = [];
   int item = 1;
   bool isLast = false;
   int score = 0;

   @override
  void initState() {
    super.initState();
    readAllQuestions();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

   void readAllQuestions() async {
     await sql.readData()
         .then((value) {
       if(value != null){
         // print('QUESTIONS: $value');
         if (this.mounted) {
           setState(() {
             queations.clear();
             queations.addAll(value);
             print('QUESTIONS: $queations');
           });
         }
       }
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.teal,
        leading: IconButton(onPressed: () => Navigator.pop(context),
         icon: Icon(Icons.arrow_back),
         iconSize: 23),
        centerTitle: true,
        title: Text('Quiz App' , style: TextStyle(fontSize: 23),),

      ),
      body: queations.length >= 5 ? Center(
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsetsDirectional.only(top: 120, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Question ${item} / ' , style: TextStyle(fontSize: 23 , fontWeight: FontWeight.bold , color: Colors.cyan.shade600),),
                  Text('${queations.length}' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold , color: Colors.grey),),
                ],
              ),

            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
                physics: const BouncingScrollPhysics(),
                // scrollDirection: Axis.horizontal,
                itemCount: queations.length,
                itemBuilder: (context, index) => buildQuestionItem(queations[index]),
                onPageChanged: (index) {
                 setState(() {
                   item = index + 1;
                   if(index == queations.length - 1){
                     isLast = true;
                   }else {
                     isLast = false;
                   }
                 });
            })
          ),
        ],
      ),
    ) : buildItem(),

    );
  }

  Widget buildQuestionItem(Map<String, dynamic> queation) => Container(
    margin: EdgeInsetsDirectional.only(end: 16, start: 16),
    child: Column(
      children: [
        Center(child: Container(
          width: 370,
          height: 45,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('${queation['question']}' , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold , color: Colors.white) ,),
          ) ,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.cyan.shade600)],
            borderRadius: BorderRadius.circular(16),
          ),
        )),
        SizedBox(height: 16,),
        Container(
          width: 370,
          height: 45,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text('${queation['FirstAnswer']}' , style: TextStyle(fontSize: 20 ,  color: Colors.black) ,),
            ),
            onTap: () {
              setState(() {
                if(isLast){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CongScreen(score: score, total: queations.length , middleTotal: queations.length /2,)));
                }else{
                  if(queation['FirstAnswer'] == queation['CorrectAnswer'])
                    score += 1;
                  pageController.jumpToPage(item);
                }
              });
            },
          ) ,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.white)],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.teal,
            ),

          ),
        ),
        SizedBox(height: 16,),
        Container(
          width: 370,
          height: 45,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text('${queation['SecondAnswer']}' , style: TextStyle(fontSize: 20 ,  color: Colors.black) ,),
            ),
            onTap: () {
              setState(() {
                if(isLast){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CongScreen(score: score, total: queations.length, middleTotal: queations.length /2,)));
                }else{
                  if(queation['SecondAnswer'] == queation['CorrectAnswer'])
                    score += 1;
                  pageController.jumpToPage(item);
                }
              });
            },
          ) ,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.white)],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.teal,
            ),

          ),
        ),
        SizedBox(height: 16,),
        Container(
          width: 370,
          height: 45,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text('${queation['ThirdAnswer']}' , style: TextStyle(fontSize: 20 ,  color: Colors.black) ,),
            ),
            onTap: () {
              setState(() {
                if(isLast){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CongScreen(score: score, total: queations.length, middleTotal: queations.length /2,)));
                }else{
                  if(queation['ThirdAnswer'] == queation['CorrectAnswer'])
                    score += 1;
                  pageController.jumpToPage(item);
                }
              });
            },
          ) ,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.white)],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.teal,
            ),

          ),
        ),
        SizedBox(height: 16,),
        Container(
          width: 370,
          height: 45,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text('${queation['FourthAnswer']}' , style: TextStyle(fontSize: 20 ,  color: Colors.black) ,),
            ),
            onTap: () {
              setState(() {
                if(isLast){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CongScreen(score: score, total: queations.length , middleTotal:queations.length /2 )));
                }else{
                  if(queation['FourthAnswer'] == queation['CorrectAnswer'])
                    score += 1;
                  pageController.jumpToPage(item);
                }
              });
            },
          ) ,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.white)],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.teal,
            ),

          ),
        ),
      ],
    ),
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