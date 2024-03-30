import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/providers/WeightAndAgeProvider.dart';
import 'package:bmi_calculator/providers/bmiProvider.dart';
import 'package:bmi_calculator/providers/hieght_provider.dart';
import 'package:bmi_calculator/widgets/bmiMeter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({super.key});

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

Text showMessage(double bmi) {
  if (bmi <= 15) {
    return Text(
      "Severe Underweight",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.red.withOpacity(0.8),
      ),
    );
  } else if (bmi <= 16) {
    return Text(
      "Moderate Underweight",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.orange.withOpacity(0.8),
      ),
    );
  } else if (bmi <= 18.5) {
    return Text(
      "Underweight",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.blue.withOpacity(0.8),
      ),
    );
  } else if (bmi <= 25) {
    return Text(
      "Normal",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.green.withOpacity(0.8),
      ),
    );
  } else if (bmi <= 30) {
    return Text(
      "Overweight",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.yellow.shade700,
      ),
    );
  } else if (bmi <= 35) {
    return Text(
      "Obese",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.orange.withOpacity(0.8),
      ),
    );
  } else if (bmi <= 40) {
    return Text(
      "Severe Obesity",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.red.withOpacity(0.8),
      ),
    );
  } else {
    return Text(
      "Very Severe Obesity",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.deepPurple.withOpacity(0.8),
      ),
    );
  }
}

String getWeightSuggestion(double height) {
  if (height >=152 && height <= 155) {
    return '41 - 53';
  } else if (height >= 155 && height <= 156) {
    return '43.1 - 55.8';
  } else if (height >= 157 && height <= 159) {
    return '44.9 - 58.9';
  } else if (height >= 160 && height <= 163) {
    return '47.2 - 61.6';
  } else if (height >= 163 && height <= 164) {
    return '49 - 64.8';
  } else if (height >= 165 && height <= 168) {
    return '51.2 - 68';
  } else if (height >= 168 && height <= 169) {
    return '53 - 70.7';
  } else if (height >= 170 && height <= 173) {
    return '55.3 - 73';
  } else if (height >= 173 && height <= 174) {
    return '57.1 - 76.6';
  } else if (height >= 175 && height <= 178) {
    return '59.4 - 79.8';
  } else if (height >= 178 && height <= 179) {
    return '61.2 - 83';
  } else if (height >= 180 && height <= 183) {
    return '63.5 - 85.7';
  } else if (height >= 183 && height <= 184) {
    return '65.3 - 88.9';
  } else if (height >= 185 && height <= 188) {
    return '67.6 - 91.6';
  } else if (height >= 188 && height <= 191) {
    return '69.4 - 94.8';
  } else {
    return 'Weight range not available for this height';
  }
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final bmiValue = ref.watch(bmiProvider.notifier).calculateBMI(
        weight: ref.watch(weightProvider),
        height: ref.watch(selectedHeightProvider));

    final heightForWeightRange = ref.watch(selectedHeightProvider);

    final bmiCategory = showMessage(bmiValue);

    final weightRange = getWeightSuggestion(heightForWeightRange);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: kcolorScheme.primary,
        centerTitle: true,
        title: const Text(
          'My Result',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 229, 237, 248),
              ),
              height: 360,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your current BMI - ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: kcolorScheme.secondary.withOpacity(0.6),
                        ),
                      ),
                      bmiCategory,
                    ],
                  ),
                  Text(
                    bmiValue.toStringAsFixed(1),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Color.fromARGB(255, 108, 173, 252),
                    ),
                  ),
                  const Expanded(
                    child: BmiMeter(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                children: [
                  Text(
                    'For your height, a normal weight range would be from  $weightRange kilograms.',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Your BMI is ${bmiValue.toStringAsFixed(1)}, indicating your weight is in the ${bmiCategory.data} category for adults of your height.',
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Maintaining a healthy weight offers benefits such as reduced risk of chronic diseases, improved mental well-being, and increased longevity',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 20,
                      shadowColor: const Color.fromARGB(255, 129, 215, 255),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 108, 173, 252),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 90, vertical: 10),
                    ),
                    child: const Text(
                      'Recalculate BMI',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
