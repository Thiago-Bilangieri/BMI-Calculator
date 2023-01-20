import 'package:bmi_calculator/bmi_bloc_pattern/bmi_bloc_pattern_controller.dart';
import 'package:bmi_calculator/bmi_bloc_pattern/bmi_state.dart';
import 'package:bmi_calculator/widgets/bmi_gauge.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BmiBlocPatternPage extends StatefulWidget {
  const BmiBlocPatternPage({Key? key}) : super(key: key);

  @override
  State<BmiBlocPatternPage> createState() => _BmiBlocPatternPageState();
}

class _BmiBlocPatternPageState extends State<BmiBlocPatternPage> {
  final controller = BmiBlocPatternController();
  final formKey = GlobalKey<FormState>();
  final weightEC = TextEditingController();
  final heightEC = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    weightEC.dispose();
    heightEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Pattern'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                StreamBuilder<BmiState>(
                  stream: controller.bmiOut,
                  builder: (context, snapshot) =>
                      BmiGauge(bmi: snapshot.data?.bmi ?? 0),
                ),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<BmiState>(
                  stream: controller.bmiOut,
                  builder: (context, snapshot) {
                    return Visibility(
                      visible: snapshot.data is BmiStateLoading,
                      child: const CircularProgressIndicator(),
                    );
                  },
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
                      controller.calc(weight: weight, height: height);
                    }
                  },
                  child: const Text("BMI Calculate"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
