import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'paddings.dart';

// height and width variables
double screenHeight = Get.height;
double screenWidth() => Get.width;

// onboarding bottom indicators spacing
Widget midSpacing = SizedBox(
  width: onBoardingButtonPadding / 2,
);

// spacing boxes
Widget spacingBox = SizedBox(
  height: screenHeight / 8,
);
Widget spacingBoxSmall = SizedBox(
  height: screenHeight / 16,
);

Widget size40SpacingBox = const SizedBox(
  height: 40,
);