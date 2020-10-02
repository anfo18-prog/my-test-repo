import 'package:flutter/material.dart';

class FormTextFieldComponent extends StatelessWidget {
  //Attributes
  final IconData icon;
  final String hintText;
  final FormFieldValidator onTap;
  final bool isPassword;
  final TextEditingController controller;

  //Constructor
  FormTextFieldComponent({@required this.icon, @required this.hintText, @required this.isPassword ,@required this.onTap, @required this.controller});

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
              controller: controller,
              obscureText: this.isPassword,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                  hintText: hintText,
                  fillColor: Colors.white

              ),
              validator: onTap,
            ),
          ),
        ],
      ),
    );
  }
}