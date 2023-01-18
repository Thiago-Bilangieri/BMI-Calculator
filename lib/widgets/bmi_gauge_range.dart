import 'package:flutter/animation.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiGaugeRange extends GaugeRange {
  BmiGaugeRange({
    super.key,
    required Color color,
    required double start,
    required double end,
    required String label,
  }) : super(
            color: color,
            endValue: end,
            startValue: start,
            label: label,
            sizeUnit: GaugeSizeUnit.factor,
            labelStyle: const GaugeTextStyle(fontFamily: "Times", fontSize: 12),
            startWidth: 0.65,
            endWidth: 0.65);
}
