import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderProviderNotifier extends StateNotifier<bool> {
  GenderProviderNotifier(bool inistate) : super(inistate);

  setGender(bool isMale) {
    state = isMale;
  }
}

final genderProvider = StateNotifierProvider<GenderProviderNotifier, bool>(
    (ref) => GenderProviderNotifier(true));
