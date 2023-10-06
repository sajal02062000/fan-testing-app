import 'dart:convert';

import 'package:fan_app/Constants/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_socket_client/web_socket_client.dart';

class HomeControllers extends GetxController {
  RxDouble intensity = 0.0.obs;
  RxBool isButtonOn = false.obs;
  String deviceId = "mqttx_05oct2023";
  final switchWebSocket = WebSocket(Uri.parse(socketSwitches));

  // function to change button state
  void changeButtonState(bool value, bool sendData, BuildContext context) {
    isButtonOn.value = value;
    if (sendData) {
      sendDataToSocket(value ? 255 : 0, context);
    }
    update();
  }

  // function to change intesity
  void changeIntensity(double value, BuildContext context) {
    intensity.value = value;
    if (value > 0) {
      changeButtonState(true, false, context);
    } else if (value == 0) {
      changeButtonState(false, false, context);
    }
    update();
  }

  // function to perform socket operation
  void afterChange(double value, BuildContext context) {
    if (value == 0) {
      sendDataToSocket(0, context);
    } else if (value > 0 && value <= 1) {
      sendDataToSocket(200, context);
      changeIntensity(1, context);
    } else if (value > 1 && value <= 2) {
      sendDataToSocket(205, context);
      changeIntensity(2, context);
    } else if (value > 2 && value <= 3) {
      sendDataToSocket(207, context);
      changeIntensity(3, context);
    } else if (value > 3 && value <= 4) {
      sendDataToSocket(210, context);
      changeIntensity(4, context);
    } else if (value > 4) {
      sendDataToSocket(255, context);
      changeIntensity(5, context);
    }
  }

  // function to bind socket for switches
  void bindAndListenSwitchesDataSocket() {
    switchWebSocket.messages.listen((event) {
      // var data = jsonDecode(event);
      // isButtonOn.value = data['S1'] >= 255;
      // intensity.value = double.parse(data['S1'].toString());
      update();
    });
  }

  // function to send data to socket
  Future<void> sendDataToSocket(double val, BuildContext context) async {
    Map body = {
      "id": deviceId,
      "S1": val,
    };
    switchWebSocket.send(jsonEncode(body));
    update();
  }

  @override
  void onInit() {
    super.onInit();
    bindAndListenSwitchesDataSocket();
  }
}
