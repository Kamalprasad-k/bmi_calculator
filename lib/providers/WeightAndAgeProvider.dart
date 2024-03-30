import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightProviderNotifier extends StateNotifier<double> {
  WeightProviderNotifier() : super(50);

  void increment() {
    state = state + 1;
  }

  void decrement() {
    if (state > 1) {
      state = state - 1;
    }
  }
}

final weightProvider = StateNotifierProvider<WeightProviderNotifier, double>(
    (ref) => WeightProviderNotifier());

class AgeProviderNotifier extends StateNotifier<int> {
  AgeProviderNotifier() : super(18);

  void increment() {
    if (state <= 98) {
      state = state + 1;
    }
  }

  void decrement() {
    if (state > 1) {
      state = state - 1;
    }
  }
}

final ageProvider = StateNotifierProvider<AgeProviderNotifier, int>(
    (ref) => AgeProviderNotifier());
