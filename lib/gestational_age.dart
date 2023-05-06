import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'sga_result.dart';



class GestationalAge extends StatefulWidget {
  const GestationalAge({Key? key}) : super(key: key);

  @override
  State<GestationalAge> createState() => _GestationalAgeState();
}

class _GestationalAgeState extends State<GestationalAge> {

  final _formKey = GlobalKey<FormState>();
  var sgaOutput;
  String age = "";
  String bd = "";
  String hc = "";
  String tcd = "";
  String cm = "";
  String efw = "";
  String nft = "";
  String ac = "";
  String fl = "";
  String ahlv = "";
  String phlv = "";
  String fch = "";
  String uari = "";
  String uapi = "";


  Future<void> model() async {
    final interpreter = await Interpreter.fromAsset('tflite/sga.tflite');

    var input = [
      [double.parse(age), double.parse(bd), double.parse(hc), double.parse(tcd),
        double.parse(cm), double.parse(efw), double.parse(nft), double.parse(ac),
        double.parse(fl), double.parse(ahlv), double.parse(phlv), double.parse(fch),
        double.parse(uari), double.parse(uapi)]
    ];

    var output = List.filled(1, 0).reshape([1, 1]);
    interpreter.run(input, output);
    sgaOutput = (output[0][0] * 100).toStringAsFixed(1) + '%';
    sgaOutput = sgaOutput.toString();
    print(sgaOutput);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFEF8F8),
        elevation: 0,
        title: Text(
          "Gestational Age",
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
                  "Please fill in the information to monitor your baby health.",
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

                // Ethnicity
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => eth = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Ethnicity",

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

                // Biparietal Diameter
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => bd = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Biparietal Diameter",

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

                // Head circumference
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => hc = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Head circumference",

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

                // Transverse Cerebellar Diameter
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => tcd = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Transverse Cerebellar Diameter",

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

                // Cisterna Magna
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => cm = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Cisterna Magna",

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

                // Estimated Fetal Weight
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => efw = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Estimated Fetal Weight",

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

                // Nuchal Fold Thickness
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => nft = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Nuchal Fold Thickness",

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

                // Abdominal Circumference
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => ac = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Abdominal Circumference",

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

                // Femur Length
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => fl = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Femur Length",

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

                // Anterior Horn of Lateral Ventricle
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => ahlv = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Anterior Horn of Lateral Ventricle",

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

                // Posterior Horn of Lateral Ventricle
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => phlv = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Posterior Horn of Lateral Ventricle",

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

                // Fetal Cerebral Hemisphere
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => fch = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Fetal Cerebral Hemisphere",

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

                // Uterine Arterial Resistance Index
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => uari = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Uterine Arterial Resistance Index",

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

                // Uterine Arterial Pulsatility Index
                TextFormField(
                  autofocus: false,
                  validator: (val) => val!.isEmpty ? "Enter a value" : null,
                  onChanged: (val) {
                    setState(() => uapi = val);
                  },
                  decoration: InputDecoration(
                    labelText: "Uterine Arterial Pulsatility Index",

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
                          MaterialPageRoute(builder: (context) => SGAResult(sgaresult: sgaOutput))
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),

        ),
      ),
    );
  }
}
