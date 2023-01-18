import 'package:bmi_calculator/widgets/bmi_gauge_range.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiGauge extends StatelessWidget {
  const BmiGauge({Key? key, required this.bmi}) : super(key: key);

  final double bmi;
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          showLabels: false,
          showAxisLine: false,
          showTicks: false,
          minimum: 12.5,
          maximum: 47.9,
          ranges: [
            BmiGaugeRange(
                color: Colors.blue,
                start: 12.5,
                end: 18.5,
                label: "Underweight "),
            BmiGaugeRange(
                color: Colors.green,
                start: 18.5,
                end: 24.5,
                label: "Healthy Weight"),
            BmiGaugeRange(
                color: Colors.yellow,
                start: 24.5,
                end: 29.9,
                label: "Overweight"),
            BmiGaugeRange(
                color: Colors.red[500]!,
                start: 29.9,
                end: 39.9,
                label: "Obesity"),
            BmiGaugeRange(
                color: Colors.red[900]!,
                start: 39.9,
                end: 49.9,
                label: "Class 3 Obesity"),
          ],
          pointers: [
            NeedlePointer(
              value: bmi,
              enableAnimation: true,
            )
          ],
        ),
      ],
    );
  }
}
