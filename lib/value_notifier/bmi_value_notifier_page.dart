import 'dart:math';

import 'package:bmi_calculator/widgets/bmi_gauge.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BmiValueNotifierPage extends StatefulWidget {
  const BmiValueNotifierPage({Key? key}) : super(key: key);

  @override
  State<BmiValueNotifierPage> createState() => _BmiValueNotifierStatePage();
}

class _BmiValueNotifierStatePage extends State<BmiValueNotifierPage> {
  final formKey = GlobalKey<FormState>();
  final weightEC = TextEditingController();
  final heightEC = TextEditingController();
  var bmi = ValueNotifier(0.0);

  void bmiCalc({required double weight, required double height}) async {
    setState(() {
      bmi.value = 0.0;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      bmi.value = weight / pow(height, 2);
    });
  }

  @override
  void dispose() {
    weightEC.dispose();
    heightEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Value Notifier'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ValueListenableBuilder<double>(
                valueListenable: bmi,
                builder: (_, bmi, __) => BmiGauge(bmi: bmi),
              ),
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
                  return null;
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
                  return null;
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
                    bmiCalc(weight: weight, height: height);
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
