import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[400],
              title: const Text('Home'),
            ),
            body: Container(
                color: Colors.white,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/page');
                      },
                      child: Container(
                        
                        padding: const EdgeInsets.all(8),
                        child: Column(children: const [
                          Icon(
                            Icons.add_box_outlined,
                            size: 60,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                            child: Text(
                              "เพิ่มสินค้า",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                      ),
                      
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/show');
                      },
                      child: Container(
                        
                        padding: const EdgeInsets.all(8),
                        child: Column(children: const [
                          Icon(
                            Icons.list_alt,
                            size: 60,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                            child: Text(
                              "แสดงสินค้า",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                      ),
                      
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/edit');
                      },
                      child: Container(
                        
                        padding: const EdgeInsets.all(8),
                        child: Column(children: const [
                          Icon(
                            Icons.edit,
                            size: 60,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                            child: Text(
                              "แก้ไข",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                      ),
                      
                    ),
                  ],
                ))));
  }
}
