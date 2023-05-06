/*
import 'package:flutter/material.dart';



class ModeResult extends StatefulWidget {
  final String moderesult;
  const ModeResult({required this.moderesult});

  @override
  State<ModeResult> createState() => _ModeResultState();
}

class _ModeResultState extends State<ModeResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFEF8F8),
        elevation: 0,
        title: Text(
          "Delivery Mode Result",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 23,
          ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[Color(0xFFEBBAB5), Color(0xFFFEF8F8)]
          ),
        ),

        child: Column(
          children: [
            Text(
              "The most probability of the delivery mode is:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(
              height: 50,
            ),

            Text(
              "${widget.moderesult}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),


    );
  }
}
*/
