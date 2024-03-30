import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/screens/resultScreen.dart';
import 'package:bmi_calculator/widgets/ageInfo.dart';
import 'package:bmi_calculator/widgets/genderInfo.dart';
import 'package:bmi_calculator/widgets/heightSelecter.dart';
import 'package:bmi_calculator/widgets/weightInfo.dart';
import 'package:flutter/material.dart';

class CalScreen extends StatefulWidget {
  const CalScreen({super.key});

  @override
  State<CalScreen> createState() => _CalScreenState();
}

class _CalScreenState extends State<CalScreen> {
  void resultScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ResultScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kcolorScheme.primary,
        centerTitle: true,
        title: const Text(
          'My Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            const GenderInfo(),
            const SizedBox(
              height: 60,
            ),
            const HeightSelector(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [WeightInfo(), AgeInfo()],
            ),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: ElevatedButton(
                onPressed: resultScreen,
                style: ElevatedButton.styleFrom(
                  elevation: 20,
                  shadowColor: const Color.fromARGB(255, 129, 215, 255),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 108, 173, 252),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 14),
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
