import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'mode_result.dart';



class DeliveryMode extends StatefulWidget {
  const DeliveryMode({Key? key}) : super(key: key);

  @override
  State<DeliveryMode> createState() => _DeliveryModeState();
}

class _DeliveryModeState extends State<DeliveryMode> {
  final _formKey = GlobalKey<FormState>();
  var modeOutput;
  String age = "";
  String heig = "";
  String pos = "";
  String plac = "";
  String hyper = "";
  String amn = "";
  String diab = "";

  List<bool> _selectedPosition = <bool>[false, false, false];
  List<bool> _selectedPlacenta = <bool>[false, false];
  List<bool> _selectedHypertension = <bool>[false, false];
  List<bool> _selectedAmnFluid = <bool>[false, false];
  List<bool> _selectedDiabetes = <bool>[false, false];

  Future<void> model() async {
    final interpreter = await Interpreter.fromAsset('tflite/sga.tflite');

    var input = [
      [double.parse(age), double.parse(heig), double.parse(pos), double.parse(plac), double.parse(hyper), double.parse(amn),
        double.parse(amn), double.parse(diab)]
    ];

    var output = List.filled(1 * 3, 0).reshape([1, 3]);
    interpreter.run(input, output);
    /*modeOutput = (output[0][0] * 100).toStringAsFixed(1) + '%';
    modeOutput = modeOutput.toString();*/
    print(modeOutput);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFEF8F8),
        elevation: 0,
        title: Text(
          "Delivery Mode",
          style: TextStyle(
          color: Colors.brown,
          fontSize: 23,
          ),
        ),
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[Color(0xFFEBBAB5), Color(0xFFFEF8F8)]
          ),
        ),

        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Please provide relevant information to monitor your childbirth delivery method.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                // Age
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => age = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Age",

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.brown,
                        width: 1 ,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                // Height
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => heig = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Height",

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.brown,
                        width: 1 ,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                // Position of Fetus
                Text(
                  "What is your fetal position?\n",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                ToggleButtons(
                  children: <Widget> [
                    Text("Breech"),
                    Text("Head"),
                    Text("Others"),
                  ],
                  isSelected: _selectedPosition,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Color(0xFF6F5651),
                  selectedColor: Colors.white,
                  fillColor: Colors.green[200],
                  color: Colors.grey,
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 80.0,
                  ),
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedPosition.length; i++) {
                        _selectedPosition[i] = i == index;
                        pos = i as String;
                      }
                    });
                  },
                ),

                SizedBox(
                  height: 15,
                ),

                // Placenta
                Text(
                  "Where is your placenta located?\n",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                ToggleButtons(
                  children: <Widget> [
                    Text("Top/Side of the uterus"),
                    Text("Bottom of the uterus"),
                  ],
                  isSelected: _selectedPlacenta,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Color(0xFF6F5651),
                  selectedColor: Colors.white,
                  fillColor: Colors.green[200],
                  color: Colors.grey,
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 120.0,
                  ),
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedPlacenta.length; i++) {
                        _selectedPlacenta[i] = i == index;
                        plac = i as String;
                      }
                    });
                  },
                ),

                SizedBox(
                  height: 15,
                ),

                // Hypertension
                Text(
                  "Do you have hypertension recently?\n",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                ToggleButtons(
                  children: <Widget> [
                    Text("No"),
                    Text("Yes"),
                  ],
                  isSelected: _selectedHypertension,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Color(0xFF6F5651),
                  selectedColor: Colors.white,
                  fillColor: Colors.green[200],
                  color: Colors.grey,
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 80.0,
                  ),
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedHypertension.length; i++) {
                        _selectedHypertension[i] = i == index;
                        hyper = i as String;
                      }
                    });
                  },
                ),

                SizedBox(
                  height: 15,
                ),

                // Amniotic Fluid
                Text(
                  "Is your amniotic fluid volume normal?\n",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                ToggleButtons(
                  children: <Widget> [
                    Text("No"),
                    Text("Yes"),
                  ],
                  isSelected: _selectedAmnFluid,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Color(0xFF6F5651),
                  selectedColor: Colors.white,
                  fillColor: Colors.green[200],
                  color: Colors.grey,
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 80.0,
                  ),
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedAmnFluid.length; i++) {
                        _selectedAmnFluid[i] = i == index;
                        amn = i as String;
                      }
                    });
                  },
                ),

                SizedBox(
                  height: 15,
                ),

                // Diabetes
                Text(
                  "Do you have high blood sugar?\n",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                ToggleButtons(
                  children: <Widget> [
                    Text("No"),
                    Text("Yes"),
                  ],
                  isSelected: _selectedDiabetes,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Color(0xFF6F5651),
                  selectedColor: Colors.white,
                  fillColor: Colors.green[200],
                  color: Colors.grey,
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 80.0,
                  ),
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedDiabetes.length; i++) {
                        _selectedDiabetes[i] = i == index;
                        diab = i as String;
                      }
                    });
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      child: Container(
                        child: Text(
                          "Predict",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onPressed: () {
                        model();
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ModeResult(moderesult: modeOutput))
                        );
                      },
                    ),
                  ],

                ),

              ],
            ),
          ),

        ),
      )

    );
  }
}
