import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/apptext.dart';

class SkillWidget extends StatefulWidget {
  final String skill;
  const SkillWidget(this.skill, {super.key});

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  bool _isHovered = false;
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = _isTapped
        ? Colors.blueGrey.shade700
        : _isHovered
        ? Colors.amber.withAlpha(100)
        : const Color(0xff2b2b2c);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isTapped = true),
        onTapUp: (_) => setState(() => _isTapped = false),
        onTapCancel: () => setState(() => _isTapped = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: bgColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/svg/${widget.skill.toLowerCase().replaceAll(' ', '-')}.svg',
                height: 16,
                width: 16,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              ),
              const SizedBox(width: 8),
              MediumText(widget.skill),
            ],
          ),
        ),
      ),
    );
  }
}
