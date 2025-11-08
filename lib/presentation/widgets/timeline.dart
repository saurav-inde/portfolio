import 'package:flutter/material.dart';

class CustomTimeline extends StatelessWidget {
  final List<Widget> children;
  final Color lineColor;
  final double lineWidth;
  final double indicatorSize;
  final EdgeInsets itemPadding;

  const CustomTimeline({
    Key? key,
    required this.children,
    this.lineColor = const Color(0xff383838),
    this.lineWidth = 2.0,
    this.indicatorSize = 20.0,
    this.itemPadding = const EdgeInsets.all(16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < children.length; i++) ...[
          _TimelineItem(
            isFirst: i == 0,
            isLast: i == children.length - 1,
            lineColor: lineColor,
            lineWidth: lineWidth,
            indicatorSize: indicatorSize,
            padding: itemPadding,
            child: children[i],
          ),
          if (i < children.length - 1) const SizedBox(height: 0),
        ],
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final Color lineColor;
  final double lineWidth;
  final double indicatorSize;
  final EdgeInsets padding;
  final Widget child;

  const _TimelineItem({
    required this.isFirst,
    required this.isLast,
    required this.lineColor,
    required this.lineWidth,
    required this.indicatorSize,
    required this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: indicatorSize / 2 + 6,
          child: Center(
            child: Container(color: Color(0xff383838), width: 4, height: 4000),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline column (line + indicator)
            SizedBox(
              width: indicatorSize + 16, // Add some spacing
              child: Column(
                children: [
                  // // Top connector line (hidden for first item)
                  if (isFirst)
                    Container(
                      height: 32,
                      width: 32,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Color(0xff383838),

                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.blur_on, color: Colors.amber),
                      // child: child,
                    ),

                  // Image.asset(
                  //   fit: BoxFit.cover,
                  //   'assets/svg/person.jpg',
                  //   frameBuilder:
                  //       (context, child, frame, wasSynchronouslyLoaded) {
                  //         return Container(
                  //           clipBehavior: Clip.hardEdge,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(6),
                  //           ),
                  //           child: child,
                  //         );
                  //       },
                  // ),
                  if (!isFirst) CustomIndicator(),

                  // // Bottom connector line (hidden for last item)
                  // if (!isLast)
                  //   Container(width: lineWidth, height: 16, color: lineColor),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: EdgeInsetsGeometry.only(bottom: 32),
                child: child,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SolidLineConnector extends StatelessWidget {
  final Color color;
  final double width;

  const SolidLineConnector({
    Key? key,
    this.color = const Color(0xff383838),
    this.width = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: width, color: color);
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
