import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EmployeePage extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {

  final String url = "https://reqres.in/api/users";
  List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getJson();

  }
  Future<String>getJson() async{
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": "application/json"}

    );
    print(response.body);
    setState(() {
      var conData =  jsonDecode(response.body);
      data = conData["data"];
    });
    return "Success";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Employee List'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context,int index){
          return Padding(
            padding: const EdgeInsets.only(top:8.0,left: 4,bottom: 8,right: 4),
            child: ListTile(
              leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage:
                      NetworkImage("${data[index]['avatar']}"),
                  backgroundColor: Colors.transparent,
                ),  

                   title: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text(data[index]['first_name'],style: TextStyle(fontWeight: FontWeight.bold),),
                       SizedBox(width: 5),
                       Text(data[index]['last_name'],style: TextStyle(fontWeight: FontWeight.bold),),
                     ],
                   ),  
                   subtitle: Text('email: ${data[index]['email']}'),  
                 ),
          );
        })
      
    );
  }
}