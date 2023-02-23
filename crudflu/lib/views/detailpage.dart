import 'package:flutter/material.dart';
import 'package:crudflu/controllers/databasehelpers.dart';
import 'package:crudflu/views/editpage.dart';
import 'package:crudflu/views/listviewpage.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  _navigateList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListProducts()),
    );

    if (result) {
      setState(() {});
    }
  }

  //create function delete
  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "deseja deletar '${widget.list[widget.index]['name']}'"),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text(
            "SIM",
            style: new TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
          primary: Colors.red),
          onPressed: () {
            databaseHelper
                .removeRegister(widget.list[widget.index]['id'].toString());
            _navigateList(context);
          },
        ),
        new ElevatedButton(
          child: new Text("CANCELAR", style: new TextStyle(color: Colors.black)),
          style: ElevatedButton.styleFrom(
          primary: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar:
      //     new AppBar(title: new Text("${widget.list[widget.index]['name']}")),
      body: new Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['name'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                Divider(),
                new Text(
                  "email : ${widget.list[widget.index]['email']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                 new Text(
                  "phone : ${widget.list[widget.index]['phone']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new ElevatedButton(
                      child: new Text("Editar"),
                      style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new EditProduct(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                    ),
                    VerticalDivider(),
                    new ElevatedButton(
                      child: new Text("Deletar"),
                      style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0))),
                      onPressed: () => confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}