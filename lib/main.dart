import 'package:flutter/material.dart';

import 'dashboard.dart';

void main() {
  runApp(MaterialApp(
    title: 'Invoice App',
    home: Login(),
  ));
}

class Login extends StatelessWidget {
  //Attribute
  final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: loginKey,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image(
                  image: AssetImage("images/logo.png"),
                  //width: 200.0,
                ),
              ),

              SizedBox(
                height: 50.0,
              ),
              Text(
                "Inicia sesión con tus datos",
                style: TextStyle(
                    color: Colors.black54,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold),
              ),
              _FormTextFieldComponent(
                icon: Icons.email,
                hintText: "Ingresa tu email",
                errorMessageText: "El email es obligatorio",
              ),
              _FormTextFieldComponent(
                icon: Icons.check_circle,
                hintText: "Ingresa tu contraseña",
                errorMessageText: "Debes asociar la contraseña",
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: RaisedButton(
                  onPressed: (){
                    if(loginKey.currentState.validate()){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyAppStateless()),
                      );
                    }
                  },
                  child: Text(
                      "Ingresar",
                      style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}

class _FormTextFieldComponent extends StatelessWidget {
  //Attributes
  final IconData icon;
  final String hintText;
  final String errorMessageText;

  //Constructor
  _FormTextFieldComponent({@required this.icon, @required this.hintText, @required this.errorMessageText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.lightGreen,
      margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  hintText: hintText,
                  fillColor: Colors.white

              ),
              validator: (value) {
                if (value.isEmpty) {
                  return errorMessageText;
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}


