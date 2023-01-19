import 'dart:math';

import 'package:bmi_calculator/change_notifier/bmi_change_notifier_controller.dart';
import 'package:bmi_calculator/widgets/bmi_gauge.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BmiChangeNotifierPage extends StatefulWidget {
  const BmiChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<BmiChangeNotifierPage> createState() => _BmiChangeNotifierPageState();
}

class _BmiChangeNotifierPageState extends State<BmiChangeNotifierPage> {
  final formKey = GlobalKey<FormState>();
  final weightEC = TextEditingController();
  final heightEC = TextEditingController();

  final controller = BmiChangeNotifierController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AnimatedBuilder(
                  animation: controller,
                  builder: (context, chield) {
                    return BmiGauge(bmi: controller.bmi);
                  }),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: weightEC,
                decoration: const InputDecoration(labelText: "Weight"),
                inputFormatters: [
                  CurrencyTextInputFormatter(
                    locale: "pt_PT",
                    decimalDigits: 2,
                    turnOffGrouping: true,
                    symbol: "",
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Weight is required";
                  }
                },
              ),
              TextFormField(
                controller: heightEC,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Height"),
                inputFormatters: [
                  CurrencyTextInputFormatter(
                    locale: "pt_PT",
                    decimalDigits: 2,
                    turnOffGrouping: true,
                    symbol: "",
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Height is required";
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  var formValid = formKey.currentState?.validate() ?? false;
                  if (formValid) {
                    var format = NumberFormat.simpleCurrency(
                      locale: "pt_PT",
                      decimalDigits: 2,
                    );
                    double weight = format.parse(weightEC.text) as double;
                    double height = format.parse(heightEC.text) as double;
                    controller.calc(weight: weight, height: height);
                  }
                },
                child: const Text("BMI Calculate"),
              )
            ],
          ),
        ),
      )),
    );
  }
}
