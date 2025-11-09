import 'package:flutter/material.dart';
import 'package:portfolio/core/apptext.dart';

class Aboutme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediumText(aboutMeIntro, color: Colors.white),
          SizedBox(height: 40),
          LargeText(
            "Milestones & Achievements",
            weight: FontWeight.bold,
            color: Colors.white,
          ),
          SizedBox(height: 20),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _milestoneWidget("+3", "YEARS OF EXPERIENCE"),
                _milestoneWidget("+10", "PROJECTS"),
                _milestoneWidget("+5", "MAJOR FRAMEWORKS"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _milestoneWidget(String title, String description) {
    return Column(
      children: [
        HugeText(title),
        MediumText(
          align: TextAlign.center,
          description,
          color: const Color.fromARGB(255, 167, 167, 167),
        ),
      ],
    );
  }
}

const aboutMeIntro =
    """I'm a Mobile & Web Application developer with 3+ years of experience; I develop software using extraordinary abilities, strategy, and design to meet any obstacle.

I have worked on a wide range of projects, from simple apps to complex enterprise-level solutions. I am constantly amazed by the power and flexibility of Flutter, and I believe that it is the future of mobile app development.""";
