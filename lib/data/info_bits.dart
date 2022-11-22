// cspell:ignore bootloader, changelist

import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';

import 'info_bit.dart';

List<InfoBit> infoBits = <InfoBit>[];

final Random _random = Random();

void _addInfo(String title, String text, String? value) {
  infoBits.add(InfoBit(title: title, text: text, value: value));
}

InfoBit getRandomInfoBit() {
  final int index = _random.nextInt(infoBits.length);
  return infoBits[index];
}

Future<void> buildInfoBits() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo info = await deviceInfo.androidInfo;

  _addInfo(
    'board',
    'My underlying board is {INFO}.',
    info.board,
  );

  _addInfo(
    'bootloader',
    'My system bootloader version number is {INFO}.',
    info.bootloader,
  );

  _addInfo(
    'brand',
    'My consumer-visible brand is {INFO}.',
    info.brand,
  );

  _addInfo(
    'device',
    'My industrial design is {INFO}.',
    info.device,
  );

  _addInfo(
    'display',
    '{INFO} is a build ID meant to be displayed to you.',
    info.display,
  );

  // Information about the current android display.

  _addInfo(
    'displayMetrics.heightInches',
    'My exact physical display height is {INFO} inches.',
    info.displayMetrics.heightInches.toString(),
  );

  _addInfo(
    'displayMetrics.widthInches',
    'My exact physical display width is {INFO} inches.',
    info.displayMetrics.widthInches.toString(),
  );

  _addInfo(
    'displayMetrics.heightPx',
    'My absolute height in pixels is {INFO} pixels.',
    info.displayMetrics.heightPx.toString(),
  );

  _addInfo(
    'displayMetrics.widthPx',
    'My absolute width in pixels is {INFO} pixels.',
    info.displayMetrics.widthPx.toString(),
  );

  _addInfo(
    'displayMetrics.xDpi',
    'I have exactly {INFO} physical pixels per inch in the X dimension.',
    info.displayMetrics.xDpi.toString(),
  );

  _addInfo(
    'displayMetrics.yDpi',
    'I have exactly {INFO} physical pixels per inch in the Y dimension.',
    info.displayMetrics.yDpi.toString(),
  );

  _addInfo(
    'displayMetrics.sizeInches',
    'My exact physical size measured diagonally across the display is {INFO} inches.',
    info.displayMetrics.sizeInches.toString(),
  );

  // Back to Android device info.

  _addInfo(
    'fingerprint',
    '{INFO} uniquely identifies this build.',
    info.fingerprint,
  );

  _addInfo(
    'hardware',
    '{INFO} is the name of the hardware.',
    info.hardware,
  );

  _addInfo(
    'host',
    '{INFO}: that\'s my hostname.',
    info.host,
  );

  _addInfo(
    'id',
    '{INFO}? Either a changelist number, or a label.',
    info.id,
  );

  _addInfo(
    'isPhysicalDevice',
    info.isPhysicalDevice ? 'I\'m a physical device.' : 'I\'m an emulator.',
    null,
  );

  _addInfo(
    'manufacturer',
    '{INFO} is my manufacturer.',
    info.manufacturer,
  );

  _addInfo(
    'model',
    'My name is {INFO}.',
    info.model,
  );

  _addInfo(
    'product',
    'As an overall product, they call me {INFO}.',
    info.product,
  );

  for (String abi in info.supported32BitAbis) {
    _addInfo(
      'supported32BitAbis',
      'I support the {INFO} 32-bit ABI.',
      abi,
    );
  }

  for (String abi in info.supported64BitAbis) {
    _addInfo(
      'supported64BitAbis',
      'I support the {INFO} 64-bit ABI.',
      abi,
    );
  }

  for (String abi in info.supportedAbis) {
    _addInfo(
      'supportedAbis',
      'I support the {INFO} ABI.',
      abi,
    );
  }

  for (String feature in info.systemFeatures) {
    _addInfo(
      'systemFeatures',
      'I have the {INFO} system feature.',
      feature,
    );
  }

  _addInfo(
    'tags',
    '{INFO} are tags that describe my build.',
    info.tags,
  );

  _addInfo(
    'type',
    'My type of build is {INFO}.',
    info.type,
  );

  // Android operating system version values

  _addInfo(
    'version.baseOS',
    'The base OS build I\'m based on is {INFO}.',
    info.version.baseOS,
  );

  _addInfo(
    'version.codename',
    'My current development codename is {INFO}.',
    info.version.codename,
  );

  _addInfo(
    'version.incremental',
    '{INFO} is the internal value used by the underlying source control to represent my build.',
    info.version.incremental,
  );

  if (info.version.previewSdkInt != null) {
    _addInfo(
      'version.previewSdkInt',
      'The developer preview revision of my pre-release SDK is {INFO}.',
      info.version.previewSdkInt.toString(),
    );
  }

  _addInfo(
    'version.release',
    'My user-visible version string is {INFO}.',
    info.version.release,
  );

  _addInfo(
    'version.sdkInt',
    'The user-visible SDK version of my framework is {INFO}.',
    info.version.sdkInt.toString(),
  );

  _addInfo(
    'version.securityPatch',
    'My user-visible security patch level is {INFO}.',
    info.version.securityPatch,
  );
}
