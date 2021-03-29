import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Controller regarding age
  TextEditingController ageSpace = new TextEditingController();

  // Controller regarding height
  TextEditingController heightSpace = new TextEditingController();

  // Controller regarding weight
  TextEditingController weightSpace = new TextEditingController();

  // Controller regarding waist circumference
  TextEditingController waistCSpace = new TextEditingController();

  double height;
  double weight;
  double waist;
  double result = 0.0;
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('ABSI Measurement Calculator')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Container(
            height: 500,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Enter your information as shown below."),
                    Container(
                      height: 50,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Sex"),
                    Container(
                      height: 40,
                      width: 100,

                      child: DropdownButton(
                          value: _value,
                          items: [
                            DropdownMenuItem(
                              child: Text("Male"),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text("Female"),
                              value: 2,
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          }),

                    )
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Age"),
                    Container(
                      height: 40,
                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: ageSpace,
                      ),
                    ),
                    Text("years"),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Height"),
                    Container(
                      height: 40,
                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: heightSpace,
                      ),
                    ),
                    Text("cm"),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Weight"),
                    Container(
                      height: 40,
                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: weightSpace,
                      ),
                    ),
                    Text("kg"),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Waist circum."),
                    Container(
                      height: 40,
                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: waistCSpace,
                      ),
                    ),
                    Text("cm"),
                  ],
                ),

                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      child: Text("Get result"),
                      onPressed: () => calculateRes(1),
                      color: Color(0xffFF1744),
                      textColor: Colors.white,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("RESULTS"),
                    Container(
                      height: 40,
                      width: 100,
                    )
                  ],
                ),
                
                Text("ABSI: \t\t\t\t\t" + result.toStringAsFixed(5)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateRes(double bmi) {
    setState(() {
      height = double.parse(heightSpace.text) / 100;
      weight = double.parse(weightSpace.text);
      waist = double.parse(waistCSpace.text) / 100;
      double bmi = weight / (height * height);

      double absi = waist / (pow(bmi, 2.0 / 3.0) * pow(height, 1.0 / 2.0));
      result = absi;
      print(result.toStringAsFixed(5));

      if(absi < -0.868){
        print("You have very low mortality risk.");
      }
      else if(absi >= -0.868 && absi < -0.272){
        print("You have low mortality risk.");
      }
      else if(absi >= -0.272 && absi < 0.229){
        print("You have average mortality risk.");
      }
      else if(absi >= 0.229 && absi < 0.798){
        print("You have high mortality risk.");
      }
      else{
        print("You have very high mortality risk.");
      }

    });
  }
}
