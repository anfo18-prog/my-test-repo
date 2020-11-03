import 'package:flutter/material.dart';
import 'package:invoice_app/widgets/list_view_cells.dart';
import 'package:invoice_app/widgets/menus.dart';

import 'model/client.dart';
import 'util/http_requests.dart';
import 'widgets/text_fields.dart';

class ClientList extends StatefulWidget {
  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  List<Client> _clients = List<Client>();

  @override
  void initState(){
    super.initState();
    _populateClients();
  }

  void _populateClients(){
    RequestsHelper().load(Client.list).then((clients) => {
      setState(() =>{
        _clients = clients
      })
    });
  }

  Future<void> _getData() async {
    setState(() {
      _populateClients();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listado de clientes"),
        backgroundColor: Colors.lightGreen,
      ),
      drawer: SideMenu(),
      body: DataTable(
        columns: [
          DataColumn(
            label: Text("Foto"),
          ),
          DataColumn(
            label: Text("Nombre"),
          ),
          DataColumn(
            label: Text("Teléfono"),
          ),
          DataColumn(
            label: Text(""),
          ),
        ],
        rows: _clients.map((client) => DataRow(
          cells: [
            DataCell(
              CircleAvatar(
                radius: 20.0,
                backgroundImage: (client.photoUrl == null || client.photoUrl.isEmpty) ? AssetImage(ListViewCells.DEFAULT_ASSET_IMAGE_PATH) : NetworkImage(client.photoUrl),
              ),
            ),
            DataCell(
              Text(client.name),
            ),
            DataCell(
              Text(client.phoneNumber),
            ),
            DataCell(
              Icon(Icons.edit),
              onTap: (){
                print("Presionado");
              }
            ),
          ],
        )).toList(),
      ),
    );
  }
}


/*
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
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              FormTextFieldComponent(
                icon: Icons.account_box,
                hintText: "Nombre de usuario",
                isPassword: false,
                onTap: (value){
                  return (value.length <= 6) ? "Debe tener al menos 6 caracteres" : null;
                },
              ),
              FormTextFieldComponent(
                icon: Icons.email,
                hintText: "Email",
                isPassword: false,
                onTap: (value){
                  return (value.length > 30) ? "Debe tener menos de 30 caracteres" : null;
                },
              ),
              FormTextFieldComponent(
                icon: Icons.phone,
                hintText: "Número de teléfono",
                isPassword: false,
                onTap: (value){
                  return (double.parse(value, (e) => null) == null) ? "Debe ser numérico" : null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


 */
