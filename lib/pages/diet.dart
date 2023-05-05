import 'package:flutter/material.dart';



class Diet extends StatefulWidget {
  const Diet({Key? key}) : super(key: key);

  @override
  State<Diet> createState() => _DietState();
}

class _DietState extends State<Diet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Diet",
        style: TextStyle(
          fontSize: 40,
        ),
      ),
    );  }
}
