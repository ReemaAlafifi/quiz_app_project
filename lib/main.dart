import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_project/Screens/CreatQuizScreen.dart';
import 'package:quiz_app_project/sqldb.dart';

import 'Screens/AddNewQuiestion.dart';
import 'Screens/HomePageScreen.dart';
import 'Screens/OopsScreen.dart';
import 'Screens/StartQuiz.dart';
import 'Screens/congratulation.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  initLocalDB();
  runApp(const MyApp());
}

void initLocalDB() async {
  SqlDb db = SqlDb();
  await db.intialDb();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return ScreenUtilInit(
     designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/HomePageScreen',
        routes: {
          '/HomePageScreen':(context) => const HomePageScreen(),
           '/CreatQuiz':(context) => const CreatQuiz(),
                '/AddNewQuestion':(context) => const AddNewQuestion(),
                  '/StartQuiz':(context) => const StartQuiz(),
                   '/OopsScreen':(context) => const OopsScreen(),
                    '/congScreen':(context) => CongScreen(),
        },         
  );
  }
  );
}
}
   
    
  

  