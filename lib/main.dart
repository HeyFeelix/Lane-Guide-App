import 'package:flutter/material.dart';
import 'package:lane_guide/step_file.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guia Wild Rift',
      home: StepForm()
    );
  }
}
