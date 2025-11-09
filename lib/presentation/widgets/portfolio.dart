import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/apptext.dart';
import 'package:portfolio/core/portfolio_details.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  String? shownProject = null;
  Map<String, dynamic>? selectedProject = null;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (shownProject != null) {
          setState(() {
            shownProject = null;
            selectedProject = null;
          });
          return false; // prevent browser navigation
        }
        return true; // allow normal back if no project is shown
      },
      child: shownProject != null
          ? Center(child: projectDetailScreen())
          : Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // existing logic remains unchanged
                  final double availableWidth = constraints.maxWidth;
                  int crossAxisCount;
                  double cardWidth;

                  if (availableWidth > 800) {
                    crossAxisCount = 3;
                    cardWidth = availableWidth / crossAxisCount - 24;
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
                        spacing: 12.0,
                        runSpacing: 16.0,
                        alignment: WrapAlignment.start,
                        children: projects.map((e) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: cardWidth,
                              maxWidth: cardWidth,
                            ),
                            child: projectCard(
                              cardWidth: cardWidth,
                              project: e,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget projectCard({
    required double cardWidth,
    required Map<String, dynamic> project,
  }) {
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
              imagePath: project['thumbnail'],
              onTap: () {
                setState(() {
                  shownProject = project['title'];
                  selectedProject = project;
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
            MediumText(project['title']),
            SizedBox(height: 4),
            SmallText(project['description'], color: Color(0xff9f9f9f)),
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
          SizedBox(height: 32),
          HugeText(selectedProject!['title'] ?? ''),
          SizedBox(height: 16),
          MediumText(selectedProject!['briefDetail'] ?? ''),

          SizedBox(height: 32),
          LargeText("🛠️ Tech Stack & Tools"),
          SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ...(selectedProject!['techStack'] as List<String>).map(
                (e) => skillWidget(e),
              ),
            ],
          ),

          SizedBox(height: 32),
          LargeText("🏋️‍♂️ Project Highlights"),
          SizedBox(height: 16),
          Wrap(
            spacing: 12,
            // runSpacing: 12,
            children: [
              ...(selectedProject!['highlights'] as List<Map>).map(
                (highlight) =>
                    projectHighlight(highlight as Map<String, dynamic>),
              ),
            ],
          ),
          SizedBox(height: 32),
          LargeText("🔥 Key Features"),
          SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 16,
            children: [
              ...(selectedProject!['keyFeatures'] as List).map(
                (e) => keyFeatures(e),
              ),
            ],
          ),
          SizedBox(height: 32),
          LargeText("📦 Deliverables"),
          SizedBox(height: 80),
          Wrap(
            spacing: 12,
            runSpacing: 96,
            children: [
              ...(selectedProject!['deliverables'] as List<Map>).map(
                (deliverible) =>
                    deliveribles(deliverible as Map<String, dynamic>),
              ),
            ],
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget projectHighlight(Map<String, dynamic> highlight) {
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
            LargeText(highlight['title']),
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

                              ...(highlight['list'] as List<String>).map(
                                (item) => Row(
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
                                    Expanded(child: MediumText(item)),
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

Widget keyFeatures(Map<String, dynamic> feature) {
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
          LargeText(feature['title']),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...(feature['list'] as List<String>)
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

Widget deliveribles(Map<String, dynamic> deliverable) {
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
              LargeText(deliverable['title']),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...(deliverable['list'])
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
      if (deliverable['icon'] != null && deliverable['icon']! != '')
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
              'assets/svg/${deliverable['icon']}',
              width: 80,
              height: 80,
              colorFilter: deliverable['icon'].contains('android')
                  ? ColorFilter.mode(Color(0xff3ddc84), BlendMode.srcIn)
                  : null,
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
