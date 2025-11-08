import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/apptext.dart';
import 'package:portfolio/presentation/widgets/timeline.dart';

class ExpertiseScreen extends StatelessWidget {
  const ExpertiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> technicalSkills = {
      "Languages": [
        "Dart",
        "Flutter",
        "Kotlin",
        "Java",
        "Python",
        "C++",
        "Go",
        "TypeScript",
        "JavaScript",
        "SQL",
        "Bash",
        "Swift",
      ],
      "Web": [
        "HTML",
        "CSS",
        "JavaScript",
        "TypeScript",
        "React",
        "Next.js",
        "Node.js",
        "Express",
        "GraphQL",
        "REST",
        "WebSockets",
        "API",
      ],
      "Mobile": [
        "Flutter",
        "Android",
        "iOS",
        "BLoC",
        "Cubit",
        "Provider",
        "Riverpod",
        "Navigation",
        "Routing",
        "Responsive UI",
        "Animations",
        "Native Code",
      ],
      "Backend": [
        "Node.js",
        "Express",
        "Spring Boot",
        "JWT",
        "OAuth2",
        "CI/CD",
        "API Design",
        "Middleware",
        "Validation",
        "Error Handling",
      ],
      "Database": [
        "PostgreSQL",
        "MySQL",
        "SQLite",
        "Firestore",
        "Realtime DB",
        "Hive",
        "Redis",
        "NoSQL",
        "SQL Queries",
        "ORM",
      ],
      "DevOps": [
        "Git",
        "GitHub",
        "GitLab",
        "Docker",
        "Linux",
        "Pub",
        "npm",
        "pip",
        "Gradle",
        "Maven",
        "Debugging",
        "Profiling",
        "Sentry",
        "Crashlytics",
      ],
      "Machine Learning": [
        "Python",
        "NumPy",
        "Pandas",
        "Matplotlib",
        "Scikit-learn",
        "TensorFlow",
        "Keras",
        "PyTorch",
        "Regression",
        "Classification",
        "CNN",
        "Time Series",
        "Feature Eng",
        "NLP",
      ],
      "Cloud": [
        "Firebase",
        "Auth",
        "Cloud Messaging",
        "Cloud Functions",
        "Firestore",
        "Storage",
        "Supabase",
        "AWS",
        "S3",
        "Lambda",
        "Amplify",
      ],
      "Architecture": [
        "Clean Arch",
        "OOP",
        "Functional",
        "Design Patterns",
        "SOLID",
        "Repository",
        "State Mgmt",
        "Modular",
      ],
      "Testing": [
        "Unit Test",
        "Widget Test",
        "Integration",
        "Mockito",
        "Mocktail",
        "Golden Test",
        "Postman",
        "Insomnia",
      ],
      "Other Skills": [
        "Agile",
        "Scrum",
        "Documentation",
        "Algorithms",
        "Data Structures",
        "Problem Solving",
        "CI/CD",
        "Performance",
        "Optimization",
        "Accessibility",
        "i18n",
        "l10n",
        "FFI",
        "Streams",
        "Isolates",
      ],
    };

    return Container(
      padding: const EdgeInsets.all(16),
      child: CustomTimeline(
        children: [
          HugeText('    Expert Skills'),
          for (var entry in technicalSkills.entries)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LargeText(entry.key),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [...entry.value.map((e) => skillWidget(e))],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget skillWidget(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xff2b2b2c),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/svg/${skill.toLowerCase().replaceAll(' ', '-')}.svg',
            height: 16,
            width: 16,
            errorBuilder: (context, error, stackTrace) => SizedBox.shrink(),
          ),
          SizedBox(width: 8),
          MediumText(skill),
        ],
      ),
    );
  }
}
