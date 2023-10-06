import 'package:fan_app/Constants/text_styles.dart';
import 'package:flutter/material.dart';


class StyledTextSize20 extends StatelessWidget {
  const StyledTextSize20({
    super.key,
    required this.text,
    this.color = Colors.black,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: regularStyleSmallLightTheme.copyWith(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

// custom styled text used under heading at the top
class StyledTextSize14 extends StatelessWidget {
  const StyledTextSize14({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.black,
    this.fontSize = 14,
    this.textAlign = TextAlign.center,
    this.maxLine = 10,
  });

  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: regularStyleSmallLightTheme.copyWith(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}

// custom styled sub-heading widget
class Styletext12 extends StatelessWidget {
  const Styletext12({
    super.key,
    required this.heading,
  });
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: regularStyleSmall.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class TextForAll extends StatelessWidget {
  const TextForAll({
    super.key,
    required this.title,
    required this.textAlignment,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 12,
    this.color = const Color(0xFF3F4650),
  });
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlignment;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

class StyledHeadingText extends StatelessWidget {
  const StyledHeadingText({
    super.key,
    required this.heading,
    this.fontSize = 20,
    this.textAlignCenter = false,
    this.fontColor = const Color(0xFF001948),
    this.maxLine = 20,
  });
  final String heading;
  final double fontSize;
  final bool textAlignCenter;
  final Color fontColor;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: headingStyle.copyWith(
        color: fontColor,
        fontSize: fontSize,
        fontFamily: 'Inter',
      ),
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlignCenter ? TextAlign.center : TextAlign.start,
    );
  }
}
