import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import 'custom_switch.dart';

class CustomToggleSwitch extends StatelessWidget {
  const CustomToggleSwitch(
      {super.key,
      required this.buttonValue,
      required this.onChangeFunction,
      required this.buttonHeight});
  final bool buttonValue;
  final ValueChanged<bool> onChangeFunction;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      child: CustomSwitch(
        value: buttonValue,
        inactiveColor: buttonColor,
        onChanged: (value) => onChangeFunction(value),
        activeColor: blueLightShade,
        isGradientThumb: true,
        activeThumbColors: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            blueLightShade,
            blueDarkShade,
          ],
        ),
        inactiveThumbColors: const LinearGradient(
          colors: [
            buttonColor,
            buttonColor,
          ],
        ),
        activeBackgroundColors: const LinearGradient(
          colors: [
            whiteColor,
            whiteColor,
          ],
        ),
        inactiveBackgroundColors: const LinearGradient(
          colors: [
            whiteColor,
            whiteColor,
          ],
        ),
      ),
    );
  }
}
