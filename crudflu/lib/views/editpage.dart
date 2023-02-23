import 'package:flutter/material.dart';
import 'package:crudflu/controllers/databasehelpers.dart';
import 'package:crudflu/views/listviewpage.dart';

class EditProduct extends StatefulWidget {
  final List list;
  final int index;

  EditProduct({this.list, this.index});

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerStock;
  TextEditingController controllerId;

  _navigateList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListProducts()),
    );

    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    controllerId =  TextEditingController(
        text: widget.list[widget.index]['id'].toString());
    controllerName = TextEditingController(
        text: widget.list[widget.index]['name'].toString());
    controllerPrice = TextEditingController(
        text: widget.list[widget.index]['email'].toString());
    controllerStock =  TextEditingController(
        text: widget.list[widget.index]['phone'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: new AppBar(
      //   title: new Text("Edit product"),
      // ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerId,
                    decoration: new InputDecoration(
                      hintText: "Id",
                      labelText: "Id",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.person, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerName,
                    validator: (value) {
                      if (value.isEmpty) return "name";
                    },
                    decoration: new InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.email, color: Colors.black),
                  title: new TextFormField(
                    controller: controllerPrice,
                    validator: (value) {
                      if (value.isEmpty) return "email";
                    },
                    decoration: new InputDecoration(
                      hintText: "email",
                      labelText: "email",
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(Icons.add_call,
                      color: Colors.black),
                  title: new TextFormField(
                    controller: controllerStock,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa Stock";
                    },
                    decoration: new InputDecoration(
                      hintText: "telefone",
                      labelText: "telefone",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                 new ElevatedButton(
                  child: new Text("Editar"),
                  style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent),
                  onPressed: () {
                    databaseHelper.editarProduct(
                        controllerId.text.trim(),
                        controllerName.text.trim(),
                        controllerPrice.text.trim(),
                        controllerStock.text.trim());
                    _navigateList(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}