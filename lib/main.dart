import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'widgets/text_fields.dart';

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
              FormTextFieldComponent(
                icon: Icons.email,
                hintText: "Ingresa tu email",
                isPassword: false,
                onTap: (value){
                  return validateEmail(value);
                },
              ),
              FormTextFieldComponent(
                icon: Icons.check_circle,
                hintText: "Ingresa tu contraseña",
                isPassword: true,
                onTap: (value){
                  return (value.length <= 6) ? "Debe tener al menos 6 caracteres" : null;
                },
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

String validateEmail(String value){
  Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);

  return (!regExp.hasMatch(value)) ? "Ingresa un email valido" : null;
}
