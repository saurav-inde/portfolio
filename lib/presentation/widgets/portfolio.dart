import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/apptext.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  String? shownProject = null;
  @override
  Widget build(BuildContext context) {
    return shownProject != null
        ? Center(child: projectDetailScreen())
        : Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate the number of columns based on available width
                final double availableWidth = constraints.maxWidth;
                int crossAxisCount;
                double cardWidth;

                if (availableWidth > 800) {
                  crossAxisCount = 3;
                  cardWidth =
                      availableWidth / crossAxisCount -
                      24; // accounting for spacing
                } else if (availableWidth > 600) {
                  crossAxisCount = 2;
                  cardWidth = availableWidth / crossAxisCount - 20;
                } else {
                  crossAxisCount = 1;
                  cardWidth = availableWidth - 16;
                }

                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 12.0, // Horizontal space between cards
                      runSpacing: 16.0, // Vertical space between cards
                      alignment: WrapAlignment.start,
                      children: List.generate(
                        13,
                        (index) => ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: cardWidth,
                            maxWidth: cardWidth,
                          ),
                          child: projectCard(cardWidth: cardWidth),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }

  Widget projectCard({required double cardWidth}) {
    // Adjust content size based on card width
    double imageHeight = cardWidth * 0.75; // 4:3 aspect ratio
    // double titleSize = cardWidth * 0.06; // Responsive font size
    // double paddingSize = cardWidth * 0.04;

    return Card(
      color: const Color(0xff1e1e1f),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: cardWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HoverImageWidget(
              width: cardWidth,
              height: imageHeight,
              imagePath: 'assets/svg/ui.jpg',
              onTap: () {
                setState(() {
                  shownProject = 'Dasho';
                });
                // Handle image view action
                print('View project image');
                // You can add:
                // - Show dialog with larger image
                // - Navigate to project detail page
                // - Open image in full screen
              },
            ), // Padding(

            SizedBox(height: 8),
            MediumText('Dasho Platform'),
            SizedBox(height: 4),
            SmallText(
              'All in one Delivery solution App for Parcel for Users, Stores and Delivery Partners',
              color: Color(0xff9f9f9f),
            ),
          ],
        ),
      ),
    );
  }

  Widget projectDetailScreen() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediumText(
            """Virtual Ref is an AI-powered fitness application designed to enhance exercise performance and minimize injury risks. By leveraging real-time pose detection, it provides instant feedback to ensure users maintain proper form during workouts. """,
            color: Color(0xffd6d6d6),
          ),

          SizedBox(height: 32),
          LargeText("🛠️ Tech Stack & Tools"),
          SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              skillWidget("Flutter"),
              skillWidget("Dart"),
              skillWidget("Typescript"),
              skillWidget("C++"),
              skillWidget("Javascript"),
              skillWidget("Kotlin"),
            ],
          ),

          SizedBox(height: 32),
          LargeText("🏋️‍♂️ Project Highlights"),
          SizedBox(height: 16),
          Wrap(
            spacing: 12,
            // runSpacing: 12,
            children: [projectHighlight(), projectHighlight()],
          ),
          SizedBox(height: 32),
          LargeText("🔥 Key Features"),
          SizedBox(height: 16),
          Wrap(
            spacing: 12,
            // runSpacing: 12,
            children: [keyFeatures(), keyFeatures()],
          ),
          SizedBox(height: 32),
          LargeText("📦 Deliverables"),
          SizedBox(height: 80),
          Wrap(
            spacing: 12,
            // runSpacing: 12,
            children: [deliveribles(), deliveribles()],
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget projectHighlight() {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        width: (MediaQuery.sizeOf(context).width > 700)
            ? ((constraints.maxWidth - 32) / 2)
            : constraints.maxWidth,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xff212124),
          borderRadius: BorderRadius.circular(12),
          border: BoxBorder.fromLTRB(
            top: BorderSide(color: Color(0xff3f3f3f)),
            left: BorderSide(color: Color(0xff3f3f3f)),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LargeText('Real-time Form Analysis'),
            SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                fit: BoxFit.fitWidth,
                "assets/svg/test.jpeg",
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          child: child,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(81, 0, 0, 0),
                                const Color.fromARGB(239, 0, 0, 0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                        child: Image.asset(
                                          'assets/svg/test.jpeg',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),

                              ...[1, 2, 3].map(
                                (e) => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(width: 12),
                                    Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: MediumText(
                                        [
                                          "Realtime Parcel Processing",
                                          "Data Sync with Cache and Postgres",
                                          "Real time tracking provided to User",
                                        ][e - 1],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     ...[
            //           "Deadlift: Hip hinge detection & posture correction",
            //           "Squat: Depth tracking & stability monitoring",
            //           "Bench Press: Bar path tracking & symmetry assessment",
            //           "Instant Feedback: Real-time guidance during exercises",
            //           "Rep Counting: Precision-based repetition tracking",
            //         ]
            //         .map((e) => MediumText(e))
            //         .expand(
            //           (element) => [
            //             Row(
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 Container(
            //                   height: 8,
            //                   width: 8,
            //                   decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     shape: BoxShape.circle,
            //                   ),
            //                 ),
            //                 SizedBox(width: 12),
            //                 Expanded(child: element),
            //               ],
            //             ),
            //             SizedBox(height: 8),
            //           ],
            //         )
            //         .toList(),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
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

Widget keyFeatures() {
  return LayoutBuilder(
    builder: (context, constraints) => Container(
      width: (MediaQuery.sizeOf(context).width > 700)
          ? ((constraints.maxWidth - 32) / 2)
          : constraints.maxWidth,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xff212124),
        borderRadius: BorderRadius.circular(12),
        border: BoxBorder.fromLTRB(
          top: BorderSide(color: Color(0xff3f3f3f)),
          left: BorderSide(color: Color(0xff3f3f3f)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LargeText('⏱️  Real-time Form Analysis'),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...[
                    "Deadlift: Hip hinge detection & posture correction",
                    "Squat: Depth tracking & stability monitoring",
                    "Bench Press: Bar path tracking & symmetry assessment",
                    "Instant Feedback: Real-time guidance during exercises",
                    "Rep Counting: Precision-based repetition tracking",
                  ]
                  .map((e) => MediumText(e))
                  .expand(
                    (element) => [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(child: element),
                        ],
                      ),
                      SizedBox(height: 8),
                    ],
                  )
                  .toList(),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget deliveribles() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      LayoutBuilder(
        builder: (context, constraints) => Container(
          width: (MediaQuery.sizeOf(context).width > 700)
              ? ((constraints.maxWidth - 32) / 2)
              : constraints.maxWidth,
          padding: EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xff212124),
            borderRadius: BorderRadius.circular(12),
            border: BoxBorder.fromLTRB(
              top: BorderSide(color: Color(0xff3f3f3f)),
              left: BorderSide(color: Color(0xff3f3f3f)),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LargeText('Android Application'),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...[
                        "Deadlift: Hip hinge detection & posture correction",
                        "Squat: Depth tracking & stability monitoring",
                        "Bench Press: Bar path tracking & symmetry assessment",
                        "Instant Feedback: Real-time guidance during exercises",
                        "Rep Counting: Precision-based repetition tracking",
                      ]
                      .map((e) => MediumText(e))
                      .expand(
                        (element) => [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(child: element),
                            ],
                          ),
                          SizedBox(height: 8),
                        ],
                      )
                      .toList(),
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: -50,
        left: 32,
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 245, 245),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(16),
          child: SvgPicture.asset(
            'assets/svg/android-development.svg',
            width: 80,
            height: 80,
            colorFilter: ColorFilter.mode(Color(0xff3ddc84), BlendMode.srcIn),
          ),
        ),
      ),
    ],
  );
}

class HoverImageWidget extends StatefulWidget {
  final double width;
  final double height;
  final String imagePath;
  final VoidCallback? onTap;

  const HoverImageWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.imagePath,
    this.onTap,
  }) : super(key: key);

  @override
  _HoverImageWidgetState createState() => _HoverImageWidgetState();
}

class _HoverImageWidgetState extends State<HoverImageWidget> {
  bool _isHovered = false;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isTapped = true),
        onTapUp: (_) => setState(() => _isTapped = false),
        onTapCancel: () => setState(() => _isTapped = false),
        onTap: widget.onTap,
        child: Stack(
          children: [
            // Image with zoom effect
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: AnimatedContainer(
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 300),
                width: widget.width,
                height: widget.height,
                child: Transform.scale(
                  scale: _isHovered ? 1.1 : 1.0,
                  child: Image.asset(widget.imagePath, fit: BoxFit.cover),
                ),
              ),
            ),

            // Dark overlay with view icon
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: _isHovered ? Colors.black54 : Colors.transparent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Center(
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: _isHovered ? 1.0 : 0.0,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      // color: Colors.black.withOpacity(0.7),
                      shape: BoxShape.circle,
                      // border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
