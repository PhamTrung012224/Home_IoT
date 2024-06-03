// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:project_home_iot/model/objects/device_object.dart';
import 'package:project_home_iot/model/objects/group_properties_object.dart';
import 'package:project_home_iot/model/repositories/group_properties_repository.dart';
import 'package:project_home_iot/presenter/constants/adafruit_constants.dart';

class GroupPropertiesPresenter extends ChangeNotifier {
  final GroupPropertiesRepository _groupPropertiesRepository =
      GroupPropertiesRepository();

  List<DeviceObject> deviceObject = [];

  void getDeviceObject() async {
    final res = await _groupPropertiesRepository.getGroupProperties(
        AdafruitConstants.username, AdafruitConstants.groupDeviceKey);
    final res1 = await _groupPropertiesRepository.getGroupProperties(
        AdafruitConstants.username, AdafruitConstants.groupDeviceListKey);

    final List<DeviceObject> device = [];
    int colorIndex = 0;
    int speedIndex = 0;

    List<dynamic> name = [];
    List<dynamic> status = [];
    List<dynamic> room = [];
    List<dynamic> image = [];
    List<dynamic> value = [];
    List<dynamic> color = [];
    List<dynamic> speed = [];

    for (int i = 0; i < res!.feeds!.length; i++) {
      if (res.feeds![i].key.contains('status')) {
        status.add([res.feeds![i].key, res.feeds![i].last_value]);
      } else if (res.feeds![i].key.contains('room')) {
        room.add([res.feeds![i].key, res.feeds![i].last_value]);
      } else if (res.feeds![i].key.contains('image')) {
        image.add([res.feeds![i].key, res.feeds![i].last_value]);
      } else if (res.feeds![i].key.contains('color')) {
        color.add([res.feeds![i].key, res.feeds![i].last_value]);
      } else if (res.feeds![i].key.contains('value')) {
        value.add([res.feeds![i].key, res.feeds![i].last_value]);
      } else {
        speed.add([res.feeds![i].key, res.feeds![i].last_value]);
      }
    }
    for (int i = 0; i < res1!.feeds!.length; i++) {
      name.add([res1.feeds![i].key, res1.feeds![i].last_value]);
    }

    for (int i = 0; i < name.length; i++) {
      String deviceName = name[i].first;
      device.add(DeviceObject(
          name: name[i],
          status: status[i],
          room: room[i],
          image: image[i],
          speed: (deviceName.contains('fan') ? speed[speedIndex++] : []),
          value: value[i],
          color: (deviceName.contains('light') ? color[colorIndex++] : [])));
    }
    deviceObject = device;
    notifyListeners();
  }

  String getDeviceName(int index) {
    return deviceObject[index].name.first;
  }
}
