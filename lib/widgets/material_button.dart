import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onPressed}) : super(key: key);
  final String text;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      color: Colors.indigo,
      height: 45,
      minWidth: MediaQuery.of(context).size.width * 0.8,
      child: Text(text, style: const TextStyle(fontSize: 17, color: Colors.white),),
    );
  }
}
