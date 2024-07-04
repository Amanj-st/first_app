import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randnum/myservices.dart';
import 'package:randnum/page2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controller = TextEditingController();
  final MyServices myServices = Get.find();
  int? _randomNumber;
  int? ss;
  String aa = "";

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    await _generateRandomNumber();
    setState(() {});
  }

  Future<void> _generateRandomNumber() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('randomNumber')) {
      _randomNumber = prefs.getInt('randomNumber'); //this is for save random number on initial app for first time
    } else {
      final random = Random();
      _randomNumber = random.nextInt(1000000);
      prefs.setInt('randomNumber', _randomNumber!);
    }
    ss = _randomNumber! * 2 - 154525;
  }

  void mathint() {
    ss = _randomNumber! * 2 - 154525;
    aa = ss.toString();

    setState(() {});

    if (controller.text == aa) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SecondPage()),
      );
      myServices.sharedPreferences?.setString("active", "yes");
      print(myServices.sharedPreferences?.getString("active"));
      print(ss);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('This Activation Code Is Wrong'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text("page 1"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text("$_randomNumber"),
              TextFormField(
                controller: controller,
              ),
              const SizedBox(height: 50),
              MaterialButton(
                color: Colors.green,
                onPressed: () {
                  mathint();
                },
                child: const Text(
                  "Go To Second Page",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  print(aa);
                },
                child: const Text(
                  "Show Activation Code",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text("$ss"),
            ],
          ),
        ),
      ),
    );
  }
}
