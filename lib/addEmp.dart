import 'package:floges/design.dart';
import 'package:floges/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Add extends StatefulWidget {
  Add({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _AddState createState() => _AddState();
}

Future<UserModel> createUser(String name, String jobTitle) async{
  final String apiUrl = "https://reqres.in/api/users";

  final response = await http.post(apiUrl, body: {
    "name": name,
    "job": jobTitle
  });

  if(response.statusCode == 201){
    final String responseString = response.body;
    
    return userModelFromJson(responseString);
  }else{
    return null;
  }
}

class _AddState extends State<Add> {

  UserModel _user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Add Employee"),
        backgroundColor: Colors.red,
      ),
      body:Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              controller: nameController,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: Colors.black,
                ),
                
                hintText: 'Name',
                hintStyle: kHintTextStyle,
              ),
            ),
            ),
            SizedBox(height: 10,),
            Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              controller: jobController,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person_add_rounded,
                  color: Colors.black,
                ),
                hintText: 'Job',
                hintStyle: kHintTextStyle,
              ),
            ),
            ),
            SizedBox(height: 20,),
            Container(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        width: double.infinity,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () async {
            final String name = nameController.text;
          final String jobTitle = jobController.text;

          final UserModel user = await createUser(name, jobTitle);

          setState(() {
            _user = user;
          });
          showDialog(
                        builder: (context) => AlertDialog(
                          title: Text("New Employee named ${_user.name} having job role as ${_user.job} with userid ${_user.id} has added"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                                jobController.clear();
                                nameController.clear();
                                // _employeeNameController.text = '';
                                // _employeeAge.text = '';
                              },
                              child: Text('OK'),
                            )
                          ],
                        ),
                        context: context,
                      );
            
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          color: Colors.red,
          child: Text(
            'ADD',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),


           
          ],
        ),
      ),
     
    );
  }
}