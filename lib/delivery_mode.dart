import 'package:flutter/material.dart';



class DeliveryMode extends StatefulWidget {
  const DeliveryMode({Key? key}) : super(key: key);

  @override
  State<DeliveryMode> createState() => _DeliveryModeState();
}

class _DeliveryModeState extends State<DeliveryMode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Delivery Mode",
        style: TextStyle(
          fontSize: 40,
        ),
      ),
    );
  }
}
