import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.image,
    required this.title,
    required this.text,
    required this.color,
    required this.radius,
    required this.onPressed,
  })  : _key = key, // _key 변수에 할당
        super(key: key);

  final Widget image;
  final Widget title;
  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;
  final Key? _key; // _key 변수 선언

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            image,
            title,
            Opacity(
              opacity: 0.0,
              child: Image.asset('images/glogo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
