import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/screens/calculationScreen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void calScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CalScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets\\images\\bmi.png',
            height: 350,
            width: double.infinity,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 36),
            child: Text(
              'Welcome 😊',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kcolorScheme.secondary,
                  fontSize: 18),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 36),
            child: Text(
              'Calculate Your BMI',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kcolorScheme.primary,
                  fontSize: 32),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(36, 12, 12, 38),
            child: Text(
              'Discover your BMI with our app! Enter your height and weight to get valuable insights into your health.Let\'s start your wellness journey today!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: ElevatedButton(
                  onPressed: calScreen,
                  style: ElevatedButton.styleFrom(
                    elevation: 20,
                    shadowColor: const Color.fromARGB(255, 129, 215, 255),
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 108, 173, 252),
                  ),
                  child: const Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          'Start',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
