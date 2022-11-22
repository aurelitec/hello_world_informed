import 'package:flutter/material.dart';

import '../common/app_strings.dart' as app_strings;
import '../data/info_bit.dart';
import '../data/info_bits.dart';
import '../widgets/info_bit_view.dart';
import 'info_bit_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InfoBit? _infoBit;

  @override
  void initState() {
    super.initState();
    _initInfoBits();
  }

  Future<void> _initInfoBits() async {
    await buildInfoBits();
    _shuffleInfoBit();
  }

  void _shuffleInfoBit() {
    setState(() {
      _infoBit = getRandomInfoBit();
    });
  }

  void _gotoList() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InfoBitListScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(app_strings.homeScreenTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.view_list),
            tooltip: app_strings.homeListTooltip,
            onPressed: _gotoList,
          ),
        ],
      ),
      body: _infoBit != null ? InfoBitView(infoBit: _infoBit!) : Container(),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _shuffleInfoBit,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
