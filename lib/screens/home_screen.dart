import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder(
        future: DeviceInfoPlugin().androidInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildDipList(snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildDipList(AndroidDeviceInfo androidInfo) {
    // print(androidInfo.data);
    return ListView(
      children: [
        ListTile(
          subtitle: const Text('The name of the underlying board'),
          title: Text(androidInfo.board),
        ),
        ListTile(
          subtitle: const Text('The system bootloader version number'),
          title: Text(androidInfo.bootloader),
        ),
        ListTile(
          subtitle: const Text(
              'The consumer-visible brand with which the product/hardware will be associated, if any.'),
          title: Text(androidInfo.brand),
        ),
        ListTile(
          subtitle: const Text('The name of the industrial design.'),
          title: Text(androidInfo.device),
        ),
        ListTile(
          subtitle: const Text('A build ID string meant for displaying to the user.'),
          title: Text(androidInfo.display),
        ),
        ListTile(
          subtitle: const Text('A string that uniquely identifies this build.'),
          title: Text(androidInfo.fingerprint),
        ),
        ListTile(
          subtitle: const Text('The name of the hardware (from the kernel command line or /proc).'),
          title: Text(androidInfo.hardware),
        ),
        ListTile(
          subtitle: const Text('Hostname'),
          title: Text(androidInfo.host),
        ),
        ListTile(
          subtitle: const Text('Either a changelist number, or a label like "M4-rc20".'),
          title: Text(androidInfo.id),
        ),
        ListTile(
          subtitle:
              const Text('false if the application is running in an emulator, true otherwise.'),
          title: Text(androidInfo.isPhysicalDevice.toString()),
        ),
        ListTile(
          subtitle: const Text('The manufacturer of the product/hardware.'),
          title: Text(androidInfo.manufacturer),
        ),
        ListTile(
          subtitle: const Text('The end-user-visible name for the end product.'),
          title: Text(androidInfo.model),
        ),
        ListTile(
          subtitle: const Text('The name of the overall product.'),
          title: Text(androidInfo.product),
        ),
        ListTile(
          subtitle: const Text('Comma-separated tags describing the build, like "unsigned,debug".'),
          title: Text(androidInfo.tags),
        ),
        ListTile(
          subtitle: const Text('The type of build, like "user" or "eng".'),
          title: Text(androidInfo.type),
        ),
      ],
    );
  }
}
