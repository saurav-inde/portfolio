import 'package:flutter/material.dart';
import 'package:portfolio/core/apptext.dart';
import 'package:portfolio/core/personal_details.dart';
import 'package:portfolio/presentation/widgets/aboutme.dart';
import 'package:portfolio/presentation/widgets/timeline.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(alignment: Alignment.topLeft, child: HugeText('About Me')),
          SizedBox(height: 16),

          Aboutme(),
          SizedBox(height: 32),
          Align(alignment: Alignment.topLeft, child: HugeText('Experience')),
          SizedBox(height: 16),

          CustomTimeline(
            children: [
              Row(children: [HugeText(align: TextAlign.start, '    ')]),

              for (var experience in experiences)
                Container(
                  width: double.infinity,
                  child: experienceWidget(experience),
                ),
            ],
          ),
          SizedBox(height: 32),
          Align(alignment: Alignment.topLeft, child: HugeText('Skills')),
          SizedBox(height: 16),

          Column(children: [...skillSection()]),
        ],
      ),
    );
  }

  Widget labelWidget(String label) {
    return LargeText(label.toUpperCase());
  }

  Widget experienceWidget(Map<String, String> skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // color: Color(0xff2b2b2c),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MediumText(skill['designation'] ?? "", weight: FontWeight.bold),
          SizedBox(height: 4),
          MediumText(skill['company'] ?? "", color: Color(0xffd6d6d6)),
          SizedBox(height: 8),
          MediumText(skill['workingPeriod'] ?? "", color: Colors.amber),
          SizedBox(height: 4),
          MediumText(skill['description'] ?? "", color: Color(0xffd6d6d6)),
        ],
      ),
    );
  }

  List<Widget> skillSection() {
    skills.sort((a, b) {
      return b['confidence']! - a['confidence']!;
    });
    return skills
        .map((e) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MediumText(e['skill']),
                  SizedBox(width: 16),
                  SmallText('${e['confidence']}%', color: Color(0xffd6d6d6)),
                ],
              ),
              SizedBox(height: 12),

              Container(
                decoration: BoxDecoration(
                  color: Color(0xff282829),
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 5,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: FractionallySizedBox(
                    widthFactor: e['confidence'] / 100,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber.withAlpha(200),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        })
        .expand((element) => [element, SizedBox(height: 16)])
        .toList();
  }
}

/// A small pulsing green circular indicator.
class CustomIndicator extends StatefulWidget {
  const CustomIndicator({super.key});

  @override
  State<CustomIndicator> createState() => _CustomIndicatorState();
}

class _CustomIndicatorState extends State<CustomIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: Color(0xff383838),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            color: Colors.amber,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
