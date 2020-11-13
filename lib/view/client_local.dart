import 'package:flutter/material.dart';
import 'package:invoice_app/model/client.dart';
import 'package:invoice_app/model/client_model.dart';
import 'package:invoice_app/widgets/menus.dart';

class ClientLocal extends StatefulWidget {
  @override
  _ClientLocalState createState() => _ClientLocalState();
}

class _ClientLocalState extends State<ClientLocal> {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final clientModel = ClientModel();
  List<Client> _clientList = List<Client>();

  String _id;
  String _name;
  String _phoneNumber;
  String _address;
  String _photoUrl;

  _ClientLocalState(){
    clientModel.findAll().then((clients) => {
      setState(() =>{
        _clientList = clients
      })
    });
  }

  void _submit(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      clientModel.save(Client(id: int.parse(_id), name: _name, phoneNumber: _phoneNumber, address: _address, photoUrl: _photoUrl));
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Bien, el dato se ha guardado correctamente"),
          duration: Duration(seconds: 3),
        )
      );
    }
  }

  void _delete(int id){
    final form = formKey.currentState;
    if(form.validate()){
      showDialog(context: _ctx, builder: (context){
        return AlertDialog(
          title: Text("Borrar cliente"),
          content: Text("¿Estás seguro de eliminar?"),
          actions: [
            MaterialButton(
              elevation: 5.0,
              child: Text("Cancelar"),
              onPressed: (){
                Navigator.of(context).pop();
              }
            ),
            MaterialButton(
                elevation: 5.0,
                child: Text("Confirmar"),
                onPressed: (){
                  clientModel.delete(id);
                  Navigator.of(context).pop();
                }
            ),
          ],
        );
      });
    }
  }

  SingleChildScrollView dataBody(){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: _clientList != null ? DataTable(
        columns: [
          DataColumn(
            label: Text("ID"),
          ),
          DataColumn(
            label: Text("Nombre"),
          ),
          DataColumn(
            label: Text("Teléfono"),
          ),
          DataColumn(
            label: Text("Acción"),
          ),
        ],
        rows: _clientList.map((client) => DataRow(
          cells: <DataCell>[
            DataCell(
              Text(client.id.toString()),
            ),
            DataCell(
              Text(client.name),
            ),
            DataCell(
              Text(client.phoneNumber),
            ),
            DataCell(
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _delete(client.id),
                alignment: Alignment.center,
              )
            ),
          ]
        )
        ).toList(),
      ) : Center(child: Text("No hay registros"),),
    );
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;

    var saveButton = RaisedButton(
        onPressed: _submit,
        child: Text("Guardar"),
      color: Colors.lightGreen,
    );

    var clientForm = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (val) => _id = val,
                  decoration: InputDecoration(
                    labelText: "ID",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (val) => _name = val,
                  decoration: InputDecoration(
                    labelText: "Nombre",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (val) => _phoneNumber = val,
                  decoration: InputDecoration(
                    labelText: "Teléfono",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (val) => _address = val,
                  decoration: InputDecoration(
                    labelText: "Dirección",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (val) => _photoUrl = val,
                  decoration: InputDecoration(
                    labelText: "Foto",
                  ),
                ),
              ),
            ],
          ),
        ),
        saveButton
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Clientes locales"),
      ),
      drawer: SideMenu(),
      key: scaffoldKey,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: [
          clientForm,
          Expanded(
            child: dataBody(),
          ),
        ],
      ),
    );
  }

}