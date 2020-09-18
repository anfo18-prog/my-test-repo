import 'package:flutter/material.dart';

class MyAppStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage("images/logo.png"),
            ),
            Text(
              "My Stateless App",
              style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Professional Design",
              style: TextStyle(
                  color: Colors.teal.shade100,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "+57 311 000 00 00",
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              child: Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "yo@mi.com",
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailView())
                  );
                },
                child: Text('Ver detalles'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Volver!'),
        ),
      ),
    );
  }
}

