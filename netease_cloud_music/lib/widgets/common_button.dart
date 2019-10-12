import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback callback;
  final String content;
  final double width;
  final double height;
  final double fontSize;

  CommonButton({
    @required this.callback,
    @required this.content,
    this.width = 250,
    this.height = 50,
    this.fontSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: RaisedButton(
        onPressed: callback,
        color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(height / 2))),
        child: Text(
          content,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ),
    );
  }
}
