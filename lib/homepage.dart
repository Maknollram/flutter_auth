import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Principal'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Você está logado.'),
              SizedBox(height: 15.0),
              new OutlineButton(
                borderSide: BorderSide(
                  color: Colors.red, 
                  style: BorderStyle.solid, 
                  width: 3.0
                ),  
                child: Text('Sair'),
                onPressed: () {
                  FirebaseAuth.instance.signOut()
                  .then((value) {
                    Navigator.of(context).pushReplacementNamed('/landingpage');
                  })
                  .catchError((e) {
                    print(e);
                  });
                }
              )
            ]
          ),
        )
      ),
    );
  }
}