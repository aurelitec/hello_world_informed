// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

// cspell:ignore bootloader, changelist

import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';

import 'info_bit.dart';

/// The list of info bits.
List<InfoBit> infoBits = <InfoBit>[];

/// A random number generator used to get a random info bit.
final Random _random = Random();

/// Convenience method to add an info bit to the list.
void _addInfo(String title, String text, String? value) {
  infoBits.add(InfoBit(title: title, text: text, value: value));
}

/// Returns a random [InfoBit] from the list of info bits.
InfoBit getRandomInfoBit() {
  final int index = _random.nextInt(infoBits.length);
  return infoBits[index];
}

/// Builds the info bits with information from the device.
Future<void> buildInfoBits() async {
  // Get the device info.
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo info = await deviceInfo.androidInfo;

  _addInfo(
    'board',
    'My underlying board is ${InfoBit.infoPlaceholder}.',
    info.board,
  );

  _addInfo(
    'bootloader',
    'My system bootloader version number is ${InfoBit.infoPlaceholder}.',
    info.bootloader,
  );

  _addInfo(
    'brand',
    'My consumer-visible brand is ${InfoBit.infoPlaceholder}.',
    info.brand,
  );

  _addInfo(
    'device',
    'My industrial design is ${InfoBit.infoPlaceholder}.',
    info.device,
  );

  _addInfo(
    'display',
    '${InfoBit.infoPlaceholder} is a build ID meant to be displayed to you.',
    info.display,
  );

  // Information about the current android display.

  _addInfo(
    'displayMetrics.heightInches',
    'My exact physical display height is ${InfoBit.infoPlaceholder} inches.',
    info.displayMetrics.heightInches.toString(),
  );

  _addInfo(
    'displayMetrics.widthInches',
    'My exact physical display width is ${InfoBit.infoPlaceholder} inches.',
    info.displayMetrics.widthInches.toString(),
  );

  _addInfo(
    'displayMetrics.heightPx',
    'My absolute height in pixels is ${InfoBit.infoPlaceholder} pixels.',
    info.displayMetrics.heightPx.toString(),
  );

  _addInfo(
    'displayMetrics.widthPx',
    'My absolute width in pixels is ${InfoBit.infoPlaceholder} pixels.',
    info.displayMetrics.widthPx.toString(),
  );

  _addInfo(
    'displayMetrics.xDpi',
    'I have exactly ${InfoBit.infoPlaceholder} physical pixels per inch in the X dimension.',
    info.displayMetrics.xDpi.toString(),
  );

  _addInfo(
    'displayMetrics.yDpi',
    'I have exactly ${InfoBit.infoPlaceholder} physical pixels per inch in the Y dimension.',
    info.displayMetrics.yDpi.toString(),
  );

  _addInfo(
    'displayMetrics.sizeInches',
    'My exact physical size measured diagonally across the display is ${InfoBit.infoPlaceholder} inches.',
    info.displayMetrics.sizeInches.toString(),
  );

  // Back to Android device info.

  _addInfo(
    'fingerprint',
    '${InfoBit.infoPlaceholder} uniquely identifies this build.',
    info.fingerprint,
  );

  _addInfo(
    'hardware',
    '${InfoBit.infoPlaceholder} is the name of the hardware.',
    info.hardware,
  );

  _addInfo(
    'host',
    '${InfoBit.infoPlaceholder}: that\'s my hostname.',
    info.host,
  );

  _addInfo(
    'id',
    '${InfoBit.infoPlaceholder}? Either a changelist number, or a label.',
    info.id,
  );

  _addInfo(
    'isPhysicalDevice',
    info.isPhysicalDevice ? 'I\'m a physical device.' : 'I\'m an emulator.',
    null,
  );

  _addInfo(
    'manufacturer',
    '${InfoBit.infoPlaceholder} is my manufacturer.',
    info.manufacturer,
  );

  _addInfo(
    'model',
    'My name is ${InfoBit.infoPlaceholder}.',
    info.model,
  );

  _addInfo(
    'product',
    'As an overall product, they call me ${InfoBit.infoPlaceholder}.',
    info.product,
  );

  for (String abi in info.supported32BitAbis) {
    _addInfo(
      'supported32BitAbis',
      'I support the ${InfoBit.infoPlaceholder} 32-bit ABI.',
      abi,
    );
  }

  for (String abi in info.supported64BitAbis) {
    _addInfo(
      'supported64BitAbis',
      'I support the ${InfoBit.infoPlaceholder} 64-bit ABI.',
      abi,
    );
  }

  for (String abi in info.supportedAbis) {
    _addInfo(
      'supportedAbis',
      'I support the ${InfoBit.infoPlaceholder} ABI.',
      abi,
    );
  }

  for (String feature in info.systemFeatures) {
    _addInfo(
      'systemFeatures',
      'I have the ${InfoBit.infoPlaceholder} system feature.',
      feature,
    );
  }

  _addInfo(
    'tags',
    '${InfoBit.infoPlaceholder} are tags that describe my build.',
    info.tags,
  );

  _addInfo(
    'type',
    'My type of build is ${InfoBit.infoPlaceholder}.',
    info.type,
  );

  // Android operating system version values

  _addInfo(
    'version.baseOS',
    'The base OS build I\'m based on is ${InfoBit.infoPlaceholder}.',
    info.version.baseOS,
  );

  _addInfo(
    'version.codename',
    'My current development codename is ${InfoBit.infoPlaceholder}.',
    info.version.codename,
  );

  _addInfo(
    'version.incremental',
    '${InfoBit.infoPlaceholder} is the internal value used by the underlying source control to represent my build.',
    info.version.incremental,
  );

  if (info.version.previewSdkInt != null) {
    _addInfo(
      'version.previewSdkInt',
      'The developer preview revision of my pre-release SDK is ${InfoBit.infoPlaceholder}.',
      info.version.previewSdkInt.toString(),
    );
  }

  _addInfo(
    'version.release',
    'My user-visible version string is ${InfoBit.infoPlaceholder}.',
    info.version.release,
  );

  _addInfo(
    'version.sdkInt',
    'The user-visible SDK version of my framework is ${InfoBit.infoPlaceholder}.',
    info.version.sdkInt.toString(),
  );

  _addInfo(
    'version.securityPatch',
    'My user-visible security patch level is ${InfoBit.infoPlaceholder}.',
    info.version.securityPatch,
  );
}
