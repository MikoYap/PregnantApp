import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'dart:io';



class FoodScanner extends StatefulWidget {
  const FoodScanner({Key? key}) : super(key: key);

  @override
  State<FoodScanner> createState() => _FoodScannerState();
}

class _FoodScannerState extends State<FoodScanner> {

  bool _loading = true;
  late File _image;
  late List _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output!;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/tflite/Food_sixclass.tflite",
      labels: "assets/tflite/label.txt",
    );
  }

  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    }
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8CBA6),
        title: Text(
          "Food Scanner",
          style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 50,),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Color(0xFFD1B7A1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                    child: _loading == true
                        ? null
                        : Container(
                      child: Column(
                        children: [
                          Container(
                            height: size.width * 0.5,
                            width: size.width * 0.5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.file(
                                _image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),

                          _output != null
                              ? Column(
                                  children: [
                                    Text(
                                    "\nThis is: ${_output[0]['label']}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),

                                    Text(
                                      _output[0]['label'] == 'chocolate cake'
                                          ? '100g:\n- Calories: 360\n- Fats: 15.1g\n- Carb: 53.4g\n- Chol: 58mg\n- Protein: 5.3g'
                                          : _output[0]['label'] == 'curry'
                                          ? '1cup:\n- Calories: 243\n- Fats: 11g\n- Carb: 7.5g\n- Chol: 74mg\n- Protein: 28g'
                                          : _output[0]['label'] == 'donut'
                                          ? '100g:\n- Calories: 374\n- Fats: 16g\n- Carb: 53g\n- Chol: 35mg\n- Protein: 15g'
                                          : _output[0]['label'] == 'hamburger'
                                          ? '218g:\n- Calories: 512\n- Fats: 27g\n- Carb: 40g\n- Chol: 87mg\n- Protein: 26g'
                                          : _output[0]['label'] == 'salad'
                                          ? '1/4cup:\n- Calories: 156\n- Fats: 12g\n- Carb: 0g\n- Chol: 14mg\n- Protein: 5g'
                                          : _output[0]['label'] == 'steak'
                                          ? '221g:\n- Calories: 614\n- Fats: 41g\n- Carb: 0g\n- Chol: 214mg\n- Protein: 58g'
                                          : "",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                              )
                              : Container(),



                          Divider(
                            height: 25,
                            thickness: 1,
                          ),
                        ],

                      ),
                    )
                ),
              ),

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: pickImage,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 10,
                    ),

                    GestureDetector(
                      onTap: pickGalleryImage,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
