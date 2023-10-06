import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final String activeText;
  final String inactiveText;
  final Color activeTextColor;
  final Color inactiveTextColor;
  final LinearGradient inactiveBackgroundColors;
  final LinearGradient activeBackgroundColors;
  final LinearGradient inactiveThumbColors;
  final LinearGradient activeThumbColors;
  final bool isGradientThumb;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
    this.activeText = '',
    this.inactiveText = '',
    this.activeTextColor = Colors.white70,
    this.inactiveTextColor = Colors.white70,
    required this.inactiveBackgroundColors,
    required this.activeBackgroundColors,
    required this.inactiveThumbColors,
    required this.activeThumbColors,
    required this.isGradientThumb,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: inactiveBackgroundColors,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 2.4,
            bottom: 2.4,
            right: 2.4,
            left: 2.4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              value
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 0),
                      child: Text(
                        activeText,
                        style: TextStyle(
                          color: activeTextColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 14.0,
                        ),
                      ),
                    )
                  : Container(),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: !isGradientThumb
                        ? !value
                            ? inactiveColor
                            : activeColor
                        : null,
                    gradient: isGradientThumb
                        ? !value
                            ? inactiveThumbColors
                            : activeThumbColors
                        : null,
                    boxShadow: isGradientThumb && value
                        ? [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: const Offset(
                                  0,
                                  2,
                                ),
                                blurRadius: 4,
                                spreadRadius: 0),
                          ]
                        : null,
                  ),
                ),
              ),
              !value
                  ? Padding(
                      padding: const EdgeInsets.only(left: 0, right: 20.0),
                      child: Text(
                        inactiveText,
                        style: TextStyle(
                          color: inactiveTextColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 14.0,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
