import 'dart:math';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../Constants/colors.dart';
import 'gradient_text.dart';

class CustomIntensityDial extends StatefulWidget {
  const CustomIntensityDial(
      {super.key,
      required this.initialIntensity,
      required this.onChangeFunction,
      required this.isFan,
      required this.maxValue});
  final double initialIntensity;
  final ValueChanged onChangeFunction;
  final bool isFan;
  final double maxValue;

  @override
  State<CustomIntensityDial> createState() => _CustomIntensityDialState();
}

class _CustomIntensityDialState extends State<CustomIntensityDial> {
  double _fanSpeed = 0;

  @override
  void initState() {
    super.initState();
    _fanSpeed = widget.initialIntensity;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (widget.isFan) {
          _fanSpeed += details.delta.dy / 30;
          if (_fanSpeed <= 0) {
            _fanSpeed = 0;
          } else if (_fanSpeed >= 5) {
            _fanSpeed = 5;
          }
        } else {
          _fanSpeed += details.delta.dy / 25;
          if (_fanSpeed <= 0) {
            _fanSpeed = 0;
          } else if (_fanSpeed >= widget.maxValue) {
            _fanSpeed = 100;
          }
        }
        widget.onChangeFunction(_fanSpeed);
      },
      child: Stack(
        children: [
          Center(
            child: Transform.rotate(
              angle: -pi / 2,
              child: CustomPaint(
                size: const Size(235, 235),
                painter: _DialIndicatorPainter(
                  widget.isFan,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 206,
              width: 206,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  300,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    blueLightShade.withOpacity(0.1),
                    blueLightShade.withOpacity(0.06),
                  ],
                ),
              ),
              child: Center(
                child: SizedBox(
                  width: 160,
                  height: 160,
                  child: SimpleShadow(
                    offset: const Offset(2, 2),
                    sigma: 2,
                    opacity: 0.3,
                    color: blackColor.withOpacity(0.3),
                    child: ClayContainer(
                      color: whiteColor,
                      height: 160,
                      width: 160,
                      borderRadius: 160,
                      depth: 0,
                      spread: 0,
                      surfaceColor: whiteColor,
                      curveType: CurveType.concave,
                      emboss: true,
                      child: Center(
                        child: GradientText(
                          widget.isFan
                              ? "${widget.initialIntensity.toInt()}"
                              : "${widget.initialIntensity.toInt()}%",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              blueDarkShade,
                              blueLightShade,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SimpleShadow(
              opacity: 0.2,
              offset: const Offset(0, 2),
              color: blackColor,
              child: CustomPaint(
                size: const Size(205, 205),
                painter: _DialProgressPainter(
                  progressValue: widget.initialIntensity,
                  isFan: widget.isFan,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// progress indicator in between the regulator and indicators
class _DialProgressPainter extends CustomPainter {
  final double progressValue;
  final bool isFan;

  _DialProgressPainter({
    required this.isFan,
    required this.progressValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    const startAngle = -pi / 2;
    double sweepAngle =
        isFan ? 2 * pi * (progressValue / 5) : 2 * pi * (progressValue / 100);

    final progressPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
        colors: [
          blueDarkShade,
          blueLightShade,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );

    // Draw the start pointer
    const startAngleRadians = startAngle + pi;
    final startPoint = Offset(
      center.dx + (radius + 15) * cos(startAngleRadians),
      center.dy + radius * sin(startAngle),
    );

    final startPointerPaint = Paint()
      ..color = whiteColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(startPoint, 8, startPointerPaint);

    // Draw the blueColor circle in the center of the start pointer
    final startMiddlePoint = Offset(
      center.dx + (radius + 15) * cos(startAngleRadians),
      center.dy + radius * sin(startAngle),
    );
    final startMiddlePaint = Paint()
      ..color = blueDarkShade
      ..style = PaintingStyle.fill;

    canvas.drawCircle(startMiddlePoint, 4, startMiddlePaint);

    // Draw the end pointer
    final endAngleRadians = startAngle + sweepAngle;
    final endPoint = Offset(
      center.dx + radius * cos(endAngleRadians),
      center.dy + radius * sin(endAngleRadians),
    );
    final endPointerPaint = Paint()
      ..color = whiteColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(endPoint, 8, endPointerPaint);

    // Draw the blueColor circle in the center of the end pointer
    final endMiddlePoint = Offset(
      center.dx + radius * cos(endAngleRadians),
      center.dy + radius * sin(endAngleRadians),
    );
    final middlePaint = Paint()
      ..color = blueDarkShade
      ..style = PaintingStyle.fill;
    canvas.drawCircle(endMiddlePoint, 4, middlePaint);
  }

  @override
  bool shouldRepaint(_DialProgressPainter oldDelegate) {
    return oldDelegate.progressValue != progressValue ||
        oldDelegate.isFan != isFan;
  }
}

// custom paint to show the indicators behind the regulator
class _DialIndicatorPainter extends CustomPainter {
  _DialIndicatorPainter(this.isFan);
  final bool isFan;
  final double _indicatorLength = 5;
  final double _indicatorSpacing = 5;

  @override
  void paint(Canvas canvas, Size size) {
    final double indicatorCount = isFan ? 5 : 35;
    final radius = size.width / 2;
    final center = Offset(radius, radius);
    final paint = Paint()
      ..color = blueLightShade
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < indicatorCount; i++) {
      final angle = i * (2 * pi / indicatorCount);
      final startPoint = Offset(
        center.dx +
            (radius - _indicatorLength - _indicatorSpacing) * cos(angle),
        center.dy +
            (radius - _indicatorLength - _indicatorSpacing) * sin(angle),
      );
      final endPoint = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
      canvas.drawLine(startPoint, endPoint, paint);
    }
  }

  @override
  bool shouldRepaint(_DialIndicatorPainter oldDelegate) => false;
}
