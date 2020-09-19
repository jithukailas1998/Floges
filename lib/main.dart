
import 'package:floges/addEmp.dart';
import 'package:floges/employeeView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Material gridData(String image, String heading, Function onTap) {
    return Material(
      color: Colors.white70,
      elevation: 12,
      shadowColor: Colors.white30,
      borderRadius: BorderRadius.circular(30),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 2, top: 6),
                        child: Image(
                          image: AssetImage(image),
                          width: 70,
                          height: 60,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        heading,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.blueGrey,
                            fontSize: 17),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text("Homepage"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 100),
        child: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 35,
          mainAxisSpacing: 12,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          children: <Widget>[
            gridData(
              "assets/view.png",
              "View Employee",
              () => {
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> EmployeePage(),
              ),
            )
                
                
              },
            ),
            gridData(
              "assets/add.png",
              "Add Employee",
              () => {
                
                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> Add(),
              ),
            )
                
              },
            )
          ],
          staggeredTiles: [
            StaggeredTile.extent(1, 120),
            StaggeredTile.extent(1, 120)
          ],
        ),
      ),
    );
    
  }
}



