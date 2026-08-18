import 'dart:async';

import 'package:flutter/material.dart';

class MainBotomSheet extends StatefulWidget {
  const MainBotomSheet({super.key});

  @override
  State<MainBotomSheet> createState() => _MainBotomSheetState();
}

class _MainBotomSheetState extends State<MainBotomSheet> {
  bool _isTimer = false;
  int _secondsLeft = 10;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _toggleTimer() {
    if (_isTimer) {
      _timer?.cancel();
      setState(() {
        _timer = null;
        _isTimer = false;
      });
      return;
    }

    setState(() {
      _isTimer = true;
      _secondsLeft = 10;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _secondsLeft--;
          if (_secondsLeft == 0) {
            timer.cancel();
            _timer = null;
            _isTimer = false;
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      constraints: const BoxConstraints(maxHeight: 100),
      backgroundColor: Colors.blue,
      onClosing: () {},
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
              ),
              child: Icon(Icons.arrow_left),
            ),
            ElevatedButton(
              onPressed: _toggleTimer,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(24),
              ),
              child: _isTimer ? Text("$_secondsLeft") : Icon(Icons.check),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(5),
              ),
              child: Icon(Icons.arrow_right),
            ),
          ],
        );
      },
    );
  }
}
