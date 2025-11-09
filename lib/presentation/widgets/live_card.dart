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
