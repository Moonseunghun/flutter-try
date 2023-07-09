import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("application bar"),
              centerTitle: true,
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => {print('clicked menu')},
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () => {print('clicked menu')},
                ),
              ],
              backgroundColor: Colors.amber[700],
            ),
            // body: Row(
            //   children: [
            //     Container(
            //       width: 150,
            //       height: 150,
            //       color: Colors.green,
            //       margin: EdgeInsets.all(20),
            //       child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             Text('phone'),
            //             Icon(Icons.star),
            //             Icon(Icons.heart_broken),
            //             Icon(Icons.star),
            //             Icon(Icons.access_alarms_outlined)
            //           ]),
            //     ),
            //     Container(
            //       width: 150,
            //       height: 150,
            //       color: Colors.green,
            //       margin: EdgeInsets.all(20),
            //       child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             Text('phone'),
            //             Icon(Icons.star),
            //             Icon(Icons.heart_broken),
            //             Icon(Icons.star),
            //             Icon(Icons.access_alarms_outlined)
            //           ]),
            //     ),
            //   ],
            // ),
            body: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'NAME',
                    style: TextStyle(color: Colors.black, letterSpacing: 2.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'bbatong',
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'BrantoPowerLevel',
                    style: TextStyle(color: Colors.black, letterSpacing: 2.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '14Level',
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.check_circle_outline),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('using lightSaber',
                          style: TextStyle(fontSize: 16.0, letterSpacing: 1.0))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.check_circle_outline),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('face interactions',
                          style: TextStyle(fontSize: 16.0, letterSpacing: 1.0))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.check_circle_outline),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('fire flames',
                          style: TextStyle(fontSize: 16.0, letterSpacing: 1.0))
                    ],
                  )
                ],
              ),
            )
            // bottomNavigationBar: BottomAppBar(
            //     child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Icon(Icons.phone),
            //     Icon(Icons.message),
            //     Icon(Icons.contact_mail)
            //   ],
            // )),
            ));
  }
}
