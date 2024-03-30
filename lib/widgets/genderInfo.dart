import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/providers/gender_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderInfo extends ConsumerWidget {
  const GenderInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectedMale = ref.watch(genderProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Birth Gender',
            style: TextStyle(
              color: kcolorScheme.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color.fromARGB(255, 108, 173, 252),
                  ),
                ),
                height: 60,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        icon: Icon(
                          Icons.male,
                          size: isSelectedMale ? 26 : 20,
                          color: isSelectedMale
                              ? Colors.white
                              : const Color.fromARGB(255, 108, 173, 252),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: isSelectedMale
                              ? const Color.fromARGB(255, 108, 173, 252)
                              : Colors.white,
                          padding: const EdgeInsets.all(18),
                        ),
                        onPressed: () {
                          ref.read(genderProvider.notifier).setGender(true);
                          print('maleisselected');
                        },
                        label: Text(
                          "Male",
                          style: TextStyle(
                            fontSize: isSelectedMale ? 18 : 16,
                            color: isSelectedMale
                                ? Colors.white
                                : const Color.fromARGB(255, 108, 173, 252),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        icon: Icon(
                          Icons.female_outlined,
                          size: isSelectedMale ? 20 : 26,
                          color: isSelectedMale
                              ? const Color.fromARGB(255, 108, 173, 252)
                              : Colors.white,
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: !isSelectedMale
                                ? const Color.fromARGB(255, 108, 173, 252)
                                : Colors.white,
                            padding: const EdgeInsets.all(18)),
                        onPressed: () {
                          ref.read(genderProvider.notifier).setGender(false);
                          print('femaleisselected');
                        },
                        label: Text(
                          "Female",
                          style: TextStyle(
                            fontSize: isSelectedMale ? 16 : 18,
                            color: isSelectedMale
                                ? const Color.fromARGB(255, 108, 173, 252)
                                : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
