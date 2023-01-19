import 'package:bmi_calculator/setState/bmi_setstate_page.dart';
import 'package:bmi_calculator/value_notifier/bmi_value_notifier.dart';
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
        title: const Text('HomePage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _goToPage(context, const BmiSetstatePage()),
              child: const Text("SetState"),
            ),
            ElevatedButton(
              onPressed: () => _goToPage(context, const BmiValueNotifier()),
              child: const Text("ValueNotifier"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Change Notifier"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Bloc Pattern (Streams)"),
            ),
          ],
        ),
      ),
    );
  }
}
