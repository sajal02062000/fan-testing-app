import 'package:fan_app/Constants/colors.dart';
import 'package:fan_app/Constants/styled_text.dart';
import 'package:fan_app/Controllers/home_controllers.dart';
import 'package:fan_app/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeControllers homeControllers = Get.put(HomeControllers());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const StyledHeadingText(
          heading: "Fan Control",
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 15,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: StyledHeadingText(
                      heading: "Fan",
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: SimpleShadow(
                      sigma: 2,
                      opacity: 0.2,
                      child: CustomToggleSwitch(
                        buttonValue: homeControllers.isButtonOn.value,
                        onChangeFunction: (value) => homeControllers
                            .changeButtonState(value, true, context),
                        buttonHeight: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Center(
                  child: SfSlider(
                    min: 0,
                    max: 5,
                    value: homeControllers.intensity.value,
                    interval: 1,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    tooltipShape: const SfPaddleTooltipShape(),
                    activeColor: blueDarkShade,
                    minorTicksPerInterval: 1,
                    onChangeEnd: (value) {
                      homeControllers.afterChange(value, context);
                    },
                    onChanged: (value) {
                      homeControllers.changeIntensity(value, context);
                    },
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: Center(
            //     child: CustomIntensityDial(
            //       initialIntensity: homeControllers.intensity.value,
            //       onChangeFunction: (value) {
            //         homeControllers.changeIntensity(value, context);
            //       },
            //       isFan: true,
            //       maxValue: 5,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
