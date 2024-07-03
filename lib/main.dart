import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:randnum/home.dart';
import 'package:randnum/myservices.dart';
import 'package:randnum/page2.dart';
import 'binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MyServices myServices = Get.find<MyServices>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: InitialBindings(),
      home: myServices.sharedPreferences?.getString("active") == "yes"
          ? const SecondPage()
          : const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
