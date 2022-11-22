import 'package:device_info_plus/device_info_plus.dart';

List<String> infoBits = <String>[];

Future<void> buildInfoBits() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

  infoBits.add('My underlying board is ${androidInfo.board}');
  infoBits.add('My system bootloader version number is ${androidInfo.bootloader}');
  infoBits.add('My consumer-visible brand is ${androidInfo.brand}');
  infoBits.add('My industrial design is ${androidInfo.device}');
  infoBits.add('${androidInfo.display} is a build ID meant to be displayed to you.');
  infoBits.add('${androidInfo.fingerprint} is a string that uniquely identifies this build.');
  infoBits.add('${androidInfo.hardware} is the name of the hardware.');
  infoBits.add('${androidInfo.host}: that\'s my hostname.');
  infoBits.add('${androidInfo.id}? Either a changelist number, or a label.');
  infoBits.add('${androidInfo.manufacturer} is my manufacturer.');
  infoBits.add('My name is ${androidInfo.model}');
  infoBits.add('As an overall product, they call me ${androidInfo.product}');
  infoBits.add('${androidInfo.tags} are tags that describe my build.');
  infoBits.add('${androidInfo.type} is my type of build.');
  infoBits.add(androidInfo.isPhysicalDevice ? 'I\'m a physical device.' : 'I\'m a virtual device.');
}
