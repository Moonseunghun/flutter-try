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
              title: Text("babtong"),
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
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text('bye'), Text('bye'), Text('bye')],
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
