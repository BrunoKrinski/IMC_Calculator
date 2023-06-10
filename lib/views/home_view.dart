import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String imcResult = "";
  String message = "";

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Container textField(
      String label, String suffix, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please insert your information!';
          }
        },
        decoration: InputDecoration(
          filled: true,
          labelText: label,
          suffixText: suffix,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
        controller: controller,
      ),
    );
  }

  void calculateIMC(){
    double height = double.parse(heightController.text) / 100;
    double weight = double.parse(weightController.text);

    double imc = weight / (height * height);

    setState(() {

      if(imc < 18.6) {
        message = 'Under Weight!';
      } else if (imc >= 18.6 && imc < 24.9) {
        message = 'Ideal Weight!';
      } else if (imc >= 24.9 && imc < 29.9) {
        message = 'Slightly Overweight';
      } else if (imc >= 29.9 && imc < 34.9) {
        message = 'Obesity I';
      } else if (imc >= 34.9 && imc < 39.9) {
        message = 'Obesity II';
      } else if (imc >= 40) {
        message = 'Obesity III';
      }

      imcResult = 'IMC = ${imc.toStringAsPrecision(3)}';
    });

    heightController.text = "";
    weightController.text = "";

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25,),
                  child: Text(
                    'IMC',
                    style: TextStyle(
                      fontSize: 100,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                    ),
                  ),
                ),
                textField(
                  'Enter your Height (cm)',
                  'cm',
                  heightController,
                ),
                textField(
                  'Enter your Weight (kg)',
                  'kg',
                  weightController,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()) {
                        calculateIMC();
                      }
                    },
                    child: Text(
                      'Calculate!',
                      style: TextStyle(fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 50),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    imcResult,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
