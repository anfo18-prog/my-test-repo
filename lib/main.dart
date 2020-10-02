import 'dart:convert';

import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'widgets/text_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    title: 'Invoice App',
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Attribute
  final loginKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: _isLoading ? Center(child: CircularProgressIndicator()) : Form(
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
                  controller: emailController,
                  icon: Icons.email,
                  hintText: "Ingresa tu email",
                  isPassword: false,
                  onTap: (value){
                    return validateEmail(value);
                  },
                ),
                FormTextFieldComponent(
                  controller: passwordController,
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
                        setState(() {
                          _isLoading = true;
                        });
                        signIn(emailController.text, passwordController.text);
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

  signIn(String email, String password) async {
    Map body = {
      'email': email,
      'password': password
    };
    var response = await http.post("https://private-59df5-client20.apiary-mock.com/client", body: body);
    var jsonResponse;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(response.statusCode == 200){
      jsonResponse = jsonDecode(response.body);
      setState(() {
        _isLoading = false;
        sharedPreferences.setString("username", jsonResponse['username']);
        sharedPreferences.setString("access_token", jsonResponse['access_token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MyAppStateless()), (Route<dynamic> route) => false);
      });

    }else{
      print(response.body);
    }
  }

}

String validateEmail(String value){
  Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);

  return (!regExp.hasMatch(value)) ? "Ingresa un email valido" : null;
}
