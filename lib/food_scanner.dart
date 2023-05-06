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
      numResults: 4,
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
      model: "assets/tflite/food_scanner_model.tflite",
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
                                      _output[0]['label'] == 'Donut'
                                          ? 'Calories: 374\nFats: 16g\nProtein: 3.9g\nCarb: 53g'
                                          : _output[0]['label'] == 'Salad'
                                          ? 'Calories: 20\nFats: 0g\nProtein: 2g\nCarb: 3g\nFiber: 2g'
                                          : _output[0]['label'] == 'Object'
                                          ? 'Nothing'
                                          : _output[0]['label'] == 'Steak'
                                          ? 'Calories: 179\nFats: 7.6g\nProtein: 26g\nCarb: 0g\n'
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
