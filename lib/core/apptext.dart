import 'package:flutter/material.dart';

/// Reusable text widgets using Montserrat font and consistent sizing.
class TinyText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? align;
  final FontWeight? weight;

  const TinyText(this.text, {super.key, this.color, this.align, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 10,
        fontWeight: weight ?? FontWeight.w300,
        color: color ?? Colors.white,
        letterSpacing: 0.2,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? align;
  final FontWeight? weight;

  const SmallText(this.text, {super.key, this.color, this.align, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12,
        fontWeight: weight ?? FontWeight.w400,
        color: color ?? Colors.white,
        letterSpacing: 0.3,
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? align;
  final FontWeight? weight;

  const MediumText(this.text, {super.key, this.color, this.align, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14,
        fontWeight: weight ?? FontWeight.w500,
        color: color ?? Colors.white,
        letterSpacing: 0.3,
      ),
    );
  }
}

class LargeText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? align;
  final FontWeight? weight;

  const LargeText(this.text, {super.key, this.color, this.align, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18,
        fontWeight: weight ?? FontWeight.w600,
        color: color ?? Colors.white,
        letterSpacing: 0.4,
      ),
    );
  }
}

class HugeText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? align;
  final FontWeight? weight;

  const HugeText(this.text, {super.key, this.color, this.align, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 24,
        fontWeight: weight ?? FontWeight.w700,
        color: color ?? Colors.white,
        letterSpacing: 0.5,
      ),
    );
  }
}

class XLText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? align;
  final FontWeight? weight;

  const XLText(this.text, {super.key, this.color, this.align, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 32,
        fontWeight: weight ?? FontWeight.w700,
        color: color ?? Colors.white,
        letterSpacing: 0.5,
      ),
    );
  }
}
