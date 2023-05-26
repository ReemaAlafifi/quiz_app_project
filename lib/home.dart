import 'package:flutter/material.dart';
import 'package:quiz_app_project/sqldb.dart';

class Homedart extends StatefulWidget {
  const Homedart({super.key});

  @override
  State<Homedart> createState() => _HomedartState();
}

class _HomedartState extends State<Homedart> {

List queations=[];

  SqlDb sql = SqlDb();
  bool isLoading =false;
  Future <List<Map>>readData()async {
    List<Map> response = await sql.readData();
    queations.addAll(response);
    isLoading=false;
   if(this.mounted){
    setState(() {
      
    });
   }
  return response;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container(
        child: ListView(
          children: [
            FutureBuilder(
              future: readData(),
              builder: (BuildContext context , AsyncSnapshot<List<Map>>snapshot){
                if (snapshot.hasData){
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:  queations .length,
                    itemBuilder: (context, i){
                     return Card(
                       child: ListTile(
                        title: Text("${snapshot.data![i]['question']}"),

                       ),
                     );
                    }

                
                  );

                }
                return Center(child: CircularProgressIndicator(),);

          }
              ),
          ],

        ),
      ) ,

    );
  }
}