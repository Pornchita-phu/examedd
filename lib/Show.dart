// @dart=2.9
import 'package:examedd/model/List.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Show extends StatefulWidget {
  const Show({key}) : super(key: key);

  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  final _formkey = GlobalKey<FormState>();
  final firebaseDatabase = FirebaseDatabase.instance.reference();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<ShowList> productall = [];

  @override
  void initState() {
    super.initState();
    setList();
  }

  void setList() {
    firebaseDatabase.child("Product").once().then((DataSnapshot dataSnapshot) {
      productall.clear();

      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;
      for (var key in keys) {
        ShowList pn =
            new ShowList(values[key]['id'], values[key]['name'].toString());
        setState(() {
          productall.add(pn);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: const Text('แสดงสินค้า'),
        ),
        body: Container(
          child: (productall.length == 0)
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("ไม่มีรายการ"),
                    ],
                  ),
                )
              : Container(
                  child: ListView.builder(
                    itemCount: productall.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                                "idสินค้า " + productall[index].id.toString()),
                            subtitle: Text("ชื่อสินค้า " +
                                productall[index].name.toString()),
                          ),
                          Divider(color: Colors.black)
                        ],
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
