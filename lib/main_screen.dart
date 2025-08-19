import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double height = 175.0;
  double weight = 80.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w900,
            color: Colors.deepOrange,
            backgroundColor: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100,),
            Text('Height:$height',style: TextStyle(fontSize: 34),),
            const SizedBox(height: 20,),
            Slider(
              min: 100,
                max: 250,
                divisions: 300,
                label: "${height.toDouble()}",
                value: height, onChanged: (value){
                setState(() {
                  height = value;
                });
            }),
            const SizedBox(height: 20,),
            Text('Weight:$weight',style: TextStyle(fontSize: 34),),
            const SizedBox(height: 20,),
            Slider(
              min: 25,
                max: 425,
                divisions: 400,
                label: "${weight.toDouble()}",
                value: weight, onChanged: (value){
                setState(() {
                  weight = value;
                });
            }),
            Text("Your BMI is :${bmi.toStringAsPrecision(4)}",style: TextStyle(fontSize: 28),),
            Text("Category:$category",style: TextStyle(fontSize: 28),)
          ],
        ),
      ),
    );
  }
  double get bmi {
    double heightInMeter = height/100;
    return weight / (heightInMeter*heightInMeter);
  }
  String get category {
    double current = bmi;
    if(current < 18.5) {
      return "Underweight";
    }else if(current >= 18.5 && current < 25 ) {
      return "Normal Weight";
    }else if(current >= 25 && current < 30 ) {
      return "Class 1 obesity";
    }else if(current >= 30 && current < 40 ) {
      return "Class 2 obesity";
    }
    return "Class 3 obesity";
  }
}