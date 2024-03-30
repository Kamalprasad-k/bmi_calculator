import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/providers/hieght_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HeightSelector extends ConsumerWidget {
  const HeightSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = ref.watch(selectedHeightProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Height',
            style: TextStyle(
              color: kcolorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '${height.toStringAsFixed(0).toString()}.cm',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kcolorScheme.primary),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SfLinearGauge(
              tickPosition: LinearElementPosition.inside,
              interval: 50,
              minimum: 100,
              maximum: 250,
              markerPointers: [
                LinearShapePointer(
                  color: const Color.fromARGB(255, 108, 173, 252),
                  value: height,
                  onChanged: (value) {
                    ref.read(selectedHeightProvider.notifier).state = value;
                    print(value);
                  },
                ),
              ],
              barPointers: [
                LinearBarPointer(
                  value: height,
                  color: const Color.fromARGB(255, 108, 173, 252),
                  thickness: 8,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}




