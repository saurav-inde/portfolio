import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/apptext.dart';
import 'package:portfolio/presentation/widgets/skill_widget.dart';
import 'package:portfolio/presentation/widgets/timeline.dart';

class ExpertiseScreen extends StatelessWidget {
  const ExpertiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> technicalSkills = {
      "Languages": [
        "C",
        "C++",
        "Python",
        "Dart",
        "Kotlin",
        "JavaScript",
        "TypeScript",
      ],

      "Mobile": [
        "Flutter",
        "React Native",
        "Android Development",
        "Android Jetpack Compose",
        "Riverpod",
        "Bloc",
        "Provider",
        "Dagger Hilt",
        "Room",
        "Retrofit",
      ],
      "Backend": [
        "Node.js",
        "Express",
        "Firebase",
        "PHP",
        "JWT",
        "Auth System Design",
        "JSON",
      ],
      "Database": ["Firestore", "PostgreSQL", "SQLite", "Room", "Drizzle ORM"],
      "Web": [
        "React.js",
        "Node.js",
        "Express",
        "PHP",
        "REST API Design",
        "WebSockets",
        "Socket.io",
      ],
      "Cloud": [
        "Firebase",
        "Google Maps",
        "Google Auth",
        "Firestore",
        "AWS EC2",
        "AWS S3",
        "FCM",
        "Razorpay PG",
        "Zoho PG",
      ],
      "Architecture": [
        "Clean Architecture",
        "MVVM Design",
        "Design Patterns",
        "SOLID",
      ],
      "Testing": ["Postman", "Insomnia"],
      "DevOps": [
        "Git",
        "GitHub",
        "GitHub Actions",
        "Nginx",
        "Shell",
        "SSH",
        "AWS EC2",
        "AWS S3",
        "Deployment Tools",
        "Pub",
        "Pip",
        "Gradle",
      ],
      "Computer Vision & AI/ML": [
        "YOLOv7",
        "YOLOv8",
        "Computer Vision",
        "Object Detection",
        "NumPy",
        "Pandas",
        "Matplotlib",
        "Scikit-learn",
        "TensorFlow",
        "CNN",
        "Sequential Networks",
        "Image Processing",
      ],

      "Other Software Skills": [
        "UI/UX Design",
        "Figma",
        "Version Management",
        "Documentation",
        "Streams",
        "Isolates",
        "CI/CD",
        "Linux",
        "Ubuntu",
      ],
      "Embedded Systems & Hardware": [
        "8085 Microprocessor",
        "8051 Microcontroller",
        "STM32",
        "ESP8266",
        "NodeMCU",
        "Arduino UNO/NANO",
        "Raspberry Pi 4",
        "Raspberry Pi",
        "Pi Camera Module",
        "Quadcopter Hardware",
        "Sensor Integration",
        "PCB Design",
        "Circuit Design",
      ],
      "IoT & Wireless Communication": [
        "Wireless Home Automation",
        "WiFi",
        "Bluetooth",
        "RF Communication",
        "MQTT",
        "IoT Protocols",
        "Sensor Networks",
        "ESP8266 Programming",
      ],
      "Embedded Software & Firmware": [
        "Arduino IDE",
        "STM32CubeIDE",
        "Embedded Systems Programming",
        "Low-level Programming",
      ],
      "Electronics Fundamentals": [
        "Digital Electronics",
        "Microprocessors",
        "Microcontrollers",
      ],
      "Robotics & Drones": [
        "Quadcopter Systems",
        "Drone Technology",
        "Flight Controllers",
        "Motor Control",
        "PID Control",
      ],
    };

    return Container(
      padding: const EdgeInsets.all(16),
      child: CustomTimeline(
        children: [
          HugeText(''),
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
                    children: [...entry.value.map((e) => SkillWidget(e))],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

}
