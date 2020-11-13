import 'package:flutter/services.dart';
import 'package:invoice_app/util/database_helper.dart';

import 'client.dart';

class ClientModel{
  DatabaseHelper con = new DatabaseHelper();

  //Find all
  Future<List<Client>> findAll() async {
    var dbClient = await con.db;
    var res = await dbClient.query("client");

    List<Client> list = res.isNotEmpty ? res.map((e) => Client.fromMap(e)).toList() : null;

    return list;
  }

  //Save
  Future<int> save(Client client) async{
    var dbClient = await con.db;
    int res = await dbClient.insert("client", client.toMap());

    return res;
  }

  //Delete
  Future<int> delete(int id) async{
    var dbClient = await con.db;
    int res = await dbClient.rawDelete('DELETE FROM client WHERE id = ?', [id]);

    return res;
  }

}