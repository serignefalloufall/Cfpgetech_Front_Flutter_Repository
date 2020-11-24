import 'package:cfpgetech_front/rooting/root.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; //pour convertir le format json

//pour créer une page Départements
class Departement extends StatefulWidget {
  @override
  _DepartementState createState() => _DepartementState();
}

class _DepartementState extends State<Departement> {
  List<dynamic> listeDepartements;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        //Si la liste n'est pas encore chargée on affiche 1 cercle de progression
        // si chargée on affiche la liste
        child: this.listeDepartements == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: this.listeDepartements == null
                    ? 0
                    : this.listeDepartements.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.greenAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: Colors.deepOrange,
                          child: Text(
                            this.listeDepartements[index]['nom'],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          onPressed: () {
                            Text('ok');
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  @override
  void initState() {
    //cette méthode s'exécute au moment de l'exécution du widget
    super.initState();
    //on cré la fonction listeDepartement
    afficheDepartements();
  }

  void afficheDepartements() {
    http.get(liste_departement_api_url).then((response) {
      setState(() {
        this.listeDepartements =
            json.decode(response.body)["myDepartementliste"];
      });
    }).catchError((error) {
      print(error);
    });
  }
}
