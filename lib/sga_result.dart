import 'package:flutter/material.dart';



class SGAResult extends StatefulWidget {
  final String sgaresult;
  const SGAResult({required this.sgaresult});

  @override
  State<SGAResult> createState() => _SGAResultState();
}

class _SGAResultState extends State<SGAResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFEF8F8),
        elevation: 0,
        title: Text(
          "Gestational Age Result",
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
              "The probability of the fetus being diagnosed with small for gestational "
                  "age is ",
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(
              height: 50,
            ),

            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFEF8F8),
              ),
              child: Center(
                child: Text(
                  "${widget.sgaresult}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6F5651),
                    fontSize: 48,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


