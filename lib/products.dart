import 'package:flutter/material.dart';
import 'package:invoice_app/model/product.dart';
import 'package:invoice_app/util/http_requests.dart';
import 'package:invoice_app/widgets/list_view_cells.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  List<Product> _products = List<Product>();

  @override
  void initState(){
    super.initState();
    _populateClients();
  }

  void _populateClients(){
    RequestsHelper().load(Product.list).then((products) => {
      setState(() =>{
        _products = products
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
        title: Text("Listado de productos"),
        backgroundColor: Colors.lightGreen,
      ),
      body: _products.length > 0 ? RefreshIndicator(
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.lightGreen,
            ),
            itemCount: _products.length,
            itemBuilder: (context, index){
              return ListViewCells.CardCellType(_products[index].photoUrl, _products[index].name, _products[index].description, _products[index].price.toString());
            },
        ),
        onRefresh: _getData,
      ) : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("No se encontraron datos"),
              FloatingActionButton(
                backgroundColor: Colors.lightGreen,
                onPressed: _getData,
                child: Icon(Icons.refresh),
              ),
            ],
          )
      ),
    );
  }
}
