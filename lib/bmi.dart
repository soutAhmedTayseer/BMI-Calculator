// ignore_for_file: library_private_types_in_public_api, file_names

import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'bmi_result_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isMale = true;
  Color appBarColor = Colors.blue;
  Color buttonColor = Colors.blue;
  Color femaleColor = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: appBarColor,
        ),
      ),
      home: BMIcalculator(
        isMale: isMale,
        onGenderChanged: (bool male) {
          setState(() {
            isMale = male;
            appBarColor = isMale ? Colors.blue : femaleColor;
            buttonColor = isMale ? Colors.blue : femaleColor;
          });
        },
        buttonColor: buttonColor,
        appBarColor: appBarColor,
      ),
    );
  }
}

class BMIcalculator extends StatefulWidget {
  final bool isMale;
  final void Function(bool) onGenderChanged;
  final Color buttonColor;
  final Color appBarColor;

  const BMIcalculator({
    super.key,
    required this.isMale,
    required this.onGenderChanged,
    required this.buttonColor,
    required this.appBarColor,
  });

  @override
  State<BMIcalculator> createState() => _BMIcalculatorState();
}

class _BMIcalculatorState extends State<BMIcalculator> {
  double height = 180;
  int age = 18;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: widget.appBarColor,
        title: const Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.onGenderChanged(true);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: widget.isMale ? widget.buttonColor : Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 80,
                              color: widget.isMale ? Colors.white : Colors.grey[400],
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Male',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: widget.isMale ? Colors.white : Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.onGenderChanged(false);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: !widget.isMale ? widget.buttonColor : Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 80,
                              color: !widget.isMale ? Colors.white : Colors.grey[400],
                            ),
                            const SizedBox(height: 15),
                            Text(
                              'Female',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: !widget.isMale ? Colors.white : Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[300],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Height',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.round().toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 40),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'CM',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      max: 220,
                      min: 80,
                      activeColor: widget.buttonColor,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Text(
                            '$weight',
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 40),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                mini: true,
                                backgroundColor: widget.buttonColor,
                                child: const Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                mini: true,
                                backgroundColor: widget.buttonColor,
                                child: const Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Text(
                            '$age',
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 40),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                mini: true,
                                backgroundColor: widget.buttonColor,
                                child: const Icon(Icons.remove),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                mini: true,
                                backgroundColor: widget.buttonColor,
                                child: const Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: widget.buttonColor,
            ),
            child: MaterialButton(
              onPressed: () {
                var result = weight / pow(height / 100, 2);
                if (kDebugMode) {
                  print(result.round());
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMIResultScreen(
                      age: age,
                      isMale: widget.isMale,
                      result: result.round(),
                      appBarColor: widget.buttonColor,
                      textColor: widget.isMale ? Colors.white : Colors.white,
                    ),
                  ),
                );
              },
              child: const Text(
                'Calculate',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
