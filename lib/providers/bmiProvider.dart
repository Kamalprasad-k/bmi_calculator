import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BmiProviderNotifier extends StateNotifier<double> {
  BmiProviderNotifier() : super(0.0);

  double calculateBMI({required double weight, required double height}) {
    if (height == 0) {
      return 0;
    } else {
      final heightInMeters = height / 100;
      final bmi = weight / pow(heightInMeters, 2);
      return bmi;
    }
  }
}

final bmiProvider = StateNotifierProvider<BmiProviderNotifier, double>(
    (ref) => BmiProviderNotifier());
