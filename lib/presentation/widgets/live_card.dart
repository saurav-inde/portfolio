import 'dart:async';

import 'package:flutter/material.dart';

class LiveIndicatorCard extends StatefulWidget {
  final Widget child;
  final bool isBottom;

  const LiveIndicatorCard({
    super.key,
    required this.child,
    this.isBottom = false,
  });

  @override
  State<LiveIndicatorCard> createState() => _LiveIndicatorCardState();
}

class _LiveIndicatorCardState extends State<LiveIndicatorCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.isBottom ? 70 : 150,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(32),
          ),
          child: AspectRatio(aspectRatio: 1.0, child: widget.child),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final scale = 1 + 0.3 * _controller.value;
              final opacity = 0.6 + (0.4 * (1 - _controller.value));
              return Transform.scale(
                scale: scale,
                child: Container(
                  clipBehavior: Clip.none,
                  height: 20 * (_controller.value),
                  width: 20 * (_controller.value),
                  decoration: BoxDecoration(
                    color: Color(
                      0xff39ff14,
                    ).withAlpha(((1 - _controller.value * 0.8) * 255).toInt()),
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Color(0xff39ff14),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class LiveIndicator extends StatefulWidget {
  /// child widget
  final Widget child;

  /// radius of indicator
  double radius;

  /// radius of spread
  double? spreadRadius;

  /// color of indicator
  Color color;

  /// duration to animate the spread, it controls how fast the ripple happens,
  Duration spreadDuration;

  /// duration to wait between spread animations. it controls the frequency of the ripples.
  Duration waitDuration;
  LiveIndicator({
    super.key,
    this.child = const SizedBox.shrink(),
    this.radius = 4,
    this.spreadRadius,
    this.color = Colors.red,
    this.spreadDuration = const Duration(seconds: 1),
    this.waitDuration = const Duration(seconds: 2),
  }) {
    spreadRadius ??= (radius * .45);
  }

  @override
  State<LiveIndicator> createState() => _LiveIndicatorState();
}

class _LiveIndicatorState extends State<LiveIndicator> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      timer = Timer.periodic((widget.spreadDuration + widget.waitDuration), (
        timer,
      ) async {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      key: GlobalKey(),
      duration: widget.spreadDuration,
      tween: Tween<double>(begin: 0, end: 1),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return SizedBox(
          height: (widget.spreadRadius! + widget.radius) * 2,
          width: (widget.spreadRadius! + widget.radius) * 2,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: widget.radius + widget.spreadRadius! * value,
                  backgroundColor: widget.color.withOpacity(.8 - value * .8),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: widget.radius,
                  backgroundColor: widget.color,
                  child: widget.child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
