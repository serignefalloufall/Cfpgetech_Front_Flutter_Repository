import 'package:cfpgetech_front/departement/depaertementListe.dart';
import 'package:cfpgetech_front/departement/departementAdd.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Color(0xff00BCD1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          //title: Text('Bienvenue'),
          title: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitWidth,
            width: 200,
            height: 200,
          ),
          centerTitle: true,
        ),
        body: Center(
            child: RaisedButton(
                child: Text('Voir nos departements'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => RegisterDepartement(),
                    )))),
      ),
    );
  }
}
