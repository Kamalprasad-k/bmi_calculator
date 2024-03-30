import 'package:bmi_calculator/providers/WeightAndAgeProvider.dart';
import 'package:bmi_calculator/providers/bmiProvider.dart';
import 'package:bmi_calculator/providers/hieght_provider.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BmiMeter extends ConsumerStatefulWidget {
  const BmiMeter({super.key});

  @override
  ConsumerState<BmiMeter> createState() => _BmiMeterState();
}

class _BmiMeterState extends ConsumerState<BmiMeter> {
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          minimum: 15,
          maximum: 40,
          ranges: [
            GaugeRange(
              startValue: 15,
              endValue: 18.4,
              color: Colors.blue,
            ),
            GaugeRange(
              startValue: 18.5,
              endValue: 24.9,
              gradient: const SweepGradient(
                colors: [Colors.blue, Colors.green],
              ),
            ),
            GaugeRange(
              startValue: 25,
              endValue: 29.9,
              gradient:
                  const SweepGradient(colors: [Colors.green, Colors.yellow]),
            ),
            GaugeRange(
              startValue: 30,
              endValue: 34.9,
              gradient:
                  const SweepGradient(colors: [Colors.yellow, Colors.orange]),
            ),
            GaugeRange(
              startValue: 35,
              endValue: 40,
              gradient:
                  const SweepGradient(colors: [Colors.orange, Colors.red]),
            ),
          ],
          pointers: [
            NeedlePointer(
              enableAnimation: true,
              animationDuration: 2000,
              needleColor: Colors.black54,
              value: ref.watch(bmiProvider.notifier).calculateBMI(
                    weight: ref.watch(weightProvider),
                    height: ref.watch(selectedHeightProvider),
                  ),
            ),
          ],
        )
      ],
    );
  }
}
