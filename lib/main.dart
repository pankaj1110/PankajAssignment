import 'package:applicant_assignments/binders/applicant_binding.dart';
import 'package:applicant_assignments/pages/applicant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialBinding: ApplicantBindings(),
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
            useMaterial3: true,
            fontFamily: "Quicksand"),
        home: Applicant());
  }
}
