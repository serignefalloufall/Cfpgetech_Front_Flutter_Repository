import 'package:cfpgetech_front/rooting/root.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterDepartement extends StatefulWidget {

  RegisterDepartementState createState() => RegisterDepartementState();

}

class RegisterDepartementState extends State {

  // Boolean variable for CircularProgressIndicator.
  bool visible = false;

  // Getting value from TextField widget.

  final nomController = TextEditingController();
  

  Future departementRegistration() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String nom = nomController.text;
    

    
    // Store all data with Param nom.
    var data = {'nom': nom};

    // Starting Web API Call.
    var response = await http.post(create_departement_api_url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    // Showing Alert Dialog with Response JSON Message.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Departement Registration Form',
                  style: TextStyle(fontSize: 21))),
          Divider(),
          Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: nomController,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Nom departement'),
              )),
          
          RaisedButton(
            onPressed: departementRegistration,
            color: Colors.green,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text('Click Here To Register Departement'),
          ),
          Visibility(
              visible: visible,
              child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: CircularProgressIndicator())),
        ],
      ),
    )));
  }
}