import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/providers/WeightAndAgeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightInfo extends ConsumerWidget {
  const WeightInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentweight = ref.watch(weightProvider);
    return Row(
      children: [
        Container(
          height: 166,
          width: 166,
          decoration: BoxDecoration(
            border: Border.all(
              color: kcolorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Weight(kg)',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kcolorScheme.primary,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        ref.read(weightProvider.notifier).decrement();
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
                      '${currentweight.toInt()}',
                      style: TextStyle(
                          fontSize: currentweight >= 100 ? 20 : 30,
                          fontWeight: FontWeight.bold,
                          color: currentweight >= 100
                              ? Colors.red
                              : kcolorScheme.primary),
                    ),
                    TextButton(
                      onPressed: () {
                        ref.read(weightProvider.notifier).increment();
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
        ),
        const SizedBox(width: 18),
      ],
    );
  }
}
