import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar( title : Text(
          "App_ Practice"
        )),
        body: Row(
          children: [
            Container(
              width: 150, height: 150, color: Colors.green,
              margin: EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Text('phone'),
                    Icon(Icons.star),
                    Icon(Icons.heart_broken),
                    Icon(Icons.star),
                    Icon(Icons.access_alarms_outlined)
                  ]

              ),
            ),
            Container(
              width: 150, height: 150, color: Colors.green,
              margin:EdgeInsets.all(20) ,
              child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Text('phone'),
                  Icon(Icons.star),
                  Icon(Icons.heart_broken),
                  Icon(Icons.star),
                  Icon(Icons.access_alarms_outlined)
                ]
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.phone),
              Icon(Icons.message),
              Icon(Icons.contact_mail)
            ],
          )
        ),

      )
    );
  }
}
