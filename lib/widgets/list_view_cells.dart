import 'package:flutter/material.dart';

class ListViewCells{
  static const String DEFAULT_ASSET_IMAGE_PATH = "images/logo.png";

  static ListTile LitTileCellType(String photoUrl, String name, String phoneNumber, IconData icon){
    return ListTile(
      leading: (photoUrl == null || photoUrl.isEmpty) ? Image.asset(ListViewCells.DEFAULT_ASSET_IMAGE_PATH) : Image.network(photoUrl),
      title: Text(name),
      subtitle: Text(phoneNumber),
      trailing: Icon(icon),
    );
  }

  static Card CardCellType(String photoUrl, String name, String phoneNumber, String address){
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0),),
            Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 35.0,
                  backgroundImage:  (photoUrl == null || photoUrl.isEmpty) ? AssetImage(ListViewCells.DEFAULT_ASSET_IMAGE_PATH) : NetworkImage(photoUrl),
                ),
                Padding(padding: EdgeInsets.all(3.0),),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 20, fontWeight:
                  FontWeight.w300
                  ),
                ),
                Text(
                  phoneNumber,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  address,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
