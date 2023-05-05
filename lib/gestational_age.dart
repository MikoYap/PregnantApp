import 'package:flutter/material.dart';



class GestationalAge extends StatefulWidget {
  const GestationalAge({Key? key}) : super(key: key);

  @override
  State<GestationalAge> createState() => _GestationalAgeState();
}

class _GestationalAgeState extends State<GestationalAge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Gestational Age",
        style: TextStyle(
          fontSize: 40,
        ),
      ),
    );  }
}
