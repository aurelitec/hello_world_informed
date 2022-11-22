import 'package:flutter/material.dart';

import '../data/info_bit.dart';
import '../data/info_bits.dart';
import '../widgets/info_bit_view.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _infoBit != null ? InfoBitView(infoBit: _infoBit!) : Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffleInfoBit,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
