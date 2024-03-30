import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/providers/WeightAndAgeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgeInfo extends ConsumerWidget {
  const AgeInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentage = ref.watch(ageProvider);

    return Container(
      height: 166,
      width: 166,
      decoration: BoxDecoration(
          border: Border.all(
            color: kcolorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Age',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kcolorScheme.primary),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    ref.read(ageProvider.notifier).decrement();
                  },
                  child: Text(
                    '-',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: kcolorScheme.primary,
                    ),
                  ),
                ),
                Text(
                  '$currentage',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: kcolorScheme.primary),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(ageProvider.notifier).increment();
                  },
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                      color: kcolorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
