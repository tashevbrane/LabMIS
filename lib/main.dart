import 'dart:io';
import 'package:flutter/material.dart';
import 'package:laboratoriski/widgets/nov_element.dart';

import 'model/list_item.dart';

void main() => runApp(Labs());

class Labs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ListItem> _ispiti = [
    ListItem(
      id: "1",
      predmet: "APS",
      datumVreme: DateTime(2022, 3, 5, 14, 30, 0),
    ),
    ListItem(
      id: "2",
      predmet: "MIS",
      datumVreme: DateTime(2022, 3, 5, 14, 30, 0),
    ),
  ];

  void _addItemFunction(BuildContext ct) {
    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NovElement(_addNewItemToList),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _addNewItemToList(ListItem item) {
    setState(() {
      _ispiti.add(item);
    });
  }

  void _deleteIspit(String id) {
    setState(() {
      _ispiti.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Испити"),
        actions: <Widget>[
          IconButton(
              onPressed: () => _addItemFunction(context), icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: _ispiti.isEmpty //ako e prazna (?)  ako ne e prazna (:)
            ? Text("Нема испити")
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 10,
                    ),
                    //listTile ovozmozuva da postavime, povekje komponenti
                    child: ListTile(
                      title: Text(
                        _ispiti[index].predmet,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      //za da prikazeme vrednost na nesto "${na sto}"
                      subtitle: Text(
                          "Датум: ${_ispiti[index].datumVreme.day}/${_ispiti[index].datumVreme.month}/${_ispiti[index].datumVreme.year}\nВреме:${_ispiti[index].datumVreme.hour}:${_ispiti[index].datumVreme.minute}"),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: (() => _deleteIspit(
                              _ispiti[index].id,
                            )),
                      ),
                    ),
                  );
                },
                itemCount: _ispiti.length,
              ),
      ),
    );
  }
}
