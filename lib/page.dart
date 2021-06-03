// @dart=2.9
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PageTest extends StatefulWidget {
  const PageTest({key}) : super(key: key);

  @override
  _PageTestState createState() => _PageTestState();
}

class _PageTestState extends State<PageTest> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController pdname = new TextEditingController();
  final firebaseDatabase = FirebaseDatabase.instance.reference();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  name(String name) {
    String key = firebaseDatabase.child("Product").push().key;
    firebaseDatabase.child("Product").child(key).set({
      'id': key,
      'name': name,
    });
  }
  void showSimpleSnackbar(String txt, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
          content: new Text(txt,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.deepOrangeAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          title: const Text('เพิ่มสินค้า'),
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
                child: SizedBox(
                  width: 500.0,
                  child: TextFormField(
                    controller: pdname,
                    decoration: InputDecoration(
                      hintText: 'ชื่อสินค้า',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'กรุณาใส่ชื่อสินค้า';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    name(pdname.text);
                    showSimpleSnackbar(
                                    "เพิ่มสินค้าสำเร็จ", context);
                  } 
                  
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: const Color(0xff0177ff))),
                    primary: Colors.red),
                child: Text(
                  'เพิ่ม',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
