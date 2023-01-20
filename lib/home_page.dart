import 'package:bmi_calculator/bmi_bloc_pattern/bmi_bloc_pattern_page.dart';
import 'package:bmi_calculator/change_notifier/bmi_change_notifier_page.dart';
import 'package:bmi_calculator/setState/bmi_setstate_page.dart';
import 'package:bmi_calculator/value_notifier/bmi_value_notifier_page.dart';
import 'package:bmi_calculator/widgets/home_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeButton(
              onPressed: () => _goToPage(context, const BmiSetstatePage()),
              widget: const Text("SetState"),
            ),
            HomeButton(
              onPressed: () => _goToPage(context, const BmiValueNotifierPage()),
              widget: const Text("ValueNotifier"),
            ),
            HomeButton(
              onPressed: () =>
                  _goToPage(context, const BmiChangeNotifierPage()),
              widget: const Text("Change Notifier"),
            ),
            HomeButton(
              onPressed: () => _goToPage(context, const BmiBlocPatternPage()),
              widget: const Text("Bloc Pattern (Streams)"),
            ),
          ],
        ),
      ),
    );
  }
}
