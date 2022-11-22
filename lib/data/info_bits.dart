// cspell:ignore bootloader, changelist

import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';

import 'info_bit.dart';

List<InfoBit> _infoBits = <InfoBit>[];

final Random _random = Random();

void _addInfo(String title, String text, String? value) {
  _infoBits.add(InfoBit(title: title, text: text, value: value));
}

InfoBit getRandomInfoBit() {
  final int index = _random.nextInt(_infoBits.length);
  return _infoBits[index];
}

Future<void> buildInfoBits() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo info = await deviceInfo.androidInfo;

  _addInfo('board', 'My underlying board is {INFO}.', info.board);

  _addInfo('bootloader', 'My system bootloader version number is {INFO}.', info.bootloader);

  _addInfo('brand', 'My consumer-visible brand is {INFO}.', info.brand);

  _addInfo('device', 'My industrial design is {INFO}.', info.device);

  _addInfo('display', '{INFO} is a build ID meant to be displayed to you.', info.display);

  // TODO: displayMetrics

  _addInfo('fingerprint', '{INFO} uniquely identifies this build.', info.fingerprint);

  _addInfo('hardware', '{INFO} is the name of the hardware.', info.hardware);

  _addInfo('host', '{INFO}: that\'s my hostname.', info.host);

  _addInfo('id', '{INFO}? Either a changelist number, or a label.', info.id);

  _addInfo('isPhysicalDevice',
      info.isPhysicalDevice ? 'I\'m a physical device.' : 'I\'m an emulator.', null);

  _addInfo('manufacturer', '{INFO} is my manufacturer.', info.manufacturer);

  _addInfo('model', 'My name is {INFO}.', info.model);

  _addInfo('product', 'As an overall product, they call me {INFO}.', info.product);

  // TODO: supported32BitAbis
  print(info.supported32BitAbis);

  // TODO: supported64BitAbis

  // TODO: supportedAbis

  // TODO: systemFeatures

  _addInfo('tags', '{INFO} are tags that describe my build.', info.tags);

  _addInfo('type', '{INFO} is my type of build.', info.type);

  // TODO: version
}
