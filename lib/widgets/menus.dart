import 'package:flutter/material.dart';
import 'package:invoice_app/dashboard.dart';
import 'package:invoice_app/products.dart';

class SideMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: Text("Andrés Forero"),
              accountEmail: Text("a@a.com"),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/logo.png"),
                fit: BoxFit.cover
              ),
            ),
          ),
          new ListTile(
            title: Text("Módulo de clientes"),
            //subtitle: Text("Créación, modificación y eliminado de clientes"),
            onTap: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ClientList())
              );
            },
          ),
          new ListTile(
            title: Text("Módulo de productos"),
            //subtitle: Text("Créación, modificación y eliminado de productos"),
            onTap: (){
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProductList())
              );
            },
          ),
        ],
      ),
    );
  }
}
