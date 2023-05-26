import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    }else{
      return _db;
    }
  }

  intialDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    Database mydb = await openDatabase(path, onCreate: _onCraet, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("onUpgrade ===============");
  }


  _onCraet(Database db, int version) async {
    Batch batch=db.batch();
    db.execute(''' 
     CREATE TABLE "questions"(
      "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      "question" TEXT NOT NULL,
      "FirstAnswer" TEXT NOT NULL,
      "SecondAnswer" TEXT NOT NULL,
      "ThirdAnswer" TEXT NOT NULL,
      "FourthAnswer" TEXT NOT NULL,
      "CorrectAnswer" TEXT NOT NULL)''');
 // await batch.commit();
    print("CREAT DATABASE AND TABLE ==========");
  }

  Future<List<Map<dynamic, dynamic>>> readData() async {
    String sql = 'SELECT * FROM questions';
    Database? mydb = await db;
    List<Map<dynamic, dynamic>> response = await mydb!.rawQuery(sql);
    return response;
  }

  Future<int> insertData(String question, String firstAnswer, String secoundAnswer, String thirdAnswer, String fourthAnswer, String correctAnswer) async {
    String sql = '''
                  INSERT INTO questions ('Question', 'FirstAnswer', 'SecondAnswer', 'ThirdAnswer', 'FourthAnswer', 'CorrectAnswer')
                  VALUES("$question", "$firstAnswer", "$secoundAnswer","$thirdAnswer", "$fourthAnswer", "$correctAnswer")
           ''';
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  Future<int> updateData(String newVal, int id) async {
    // TODO UPDATE table_name
    // SET column1 = value1, column2 = value2, ...
    // WHERE condition;
    String sql = 'UPDATE questions SET "CorrectAnswer" = "$newVal" WHERE id=$id';
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  Future<int> deleteData(int id) async {
    // TODO DELETE FROM table_name WHERE condition;
    String sql = 'DELETE FROM questions WHERE id=$id';
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
