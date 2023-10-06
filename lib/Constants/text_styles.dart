// heading TextStyle
import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle headingStyle = const TextStyle(
  color: whiteColor,
  fontWeight: FontWeight.bold,
  fontSize: 24,
  fontFamily: "inter",
);

// subHeading TextStyle
TextStyle subHeadingStyle = const TextStyle(
  color: whiteColor,
  fontWeight: FontWeight.w500,
  fontSize: 18,
  fontFamily: "inter",
);

// regular TextStyle with size 14
TextStyle regularStyleSmall = const TextStyle(
  color: whiteColor,
  fontSize: 14,
  fontFamily: "inter",
);
TextStyle regularStyleSmallLightTheme = TextStyle(
  color: blackColor.withOpacity(0.7),
  fontSize: 14,
  fontFamily: "inter",
);

// regular TextStyle with size 16
TextStyle regularStyleLarge = const TextStyle(
  color: whiteColor,
  fontSize: 16,
  fontFamily: "inter",
);
TextStyle regularStyleLargeLightTheme = TextStyle(
  color: blackColor.withOpacity(0.7),
  fontSize: 16,
  fontFamily: "inter",
);

// TextStyle with no size and no font weight
TextStyle defaultTextStyle = const TextStyle(
  color: whiteColor,
  fontFamily: "inter",
);

TextStyle textFieldTextStyle = const TextStyle(
  color: generalTextColor,
  fontSize: 15,
  fontWeight: FontWeight.w400,
  fontFamily: "Inter",
);
