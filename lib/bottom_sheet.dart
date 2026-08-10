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
  Widget build(BuildContext context) {
    return BottomSheet(
      constraints: BoxConstraints(maxHeight: 100),
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
              onPressed: () {
                setState(() {
                  _isTimer = !_isTimer;
                  if (_isTimer) {
                    _secondsLeft = 10;
                    _timer = Timer.periodic(const Duration(seconds: 1), (
                      timer,
                    ) {
                      if (_secondsLeft > 0) {
                        setState(() {
                          _secondsLeft--;
                        });
                      } else {
                        _timer?.cancel();
                        _isTimer = false;
                        setState(() {});
                      }
                    });
                  }
                });
              },
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
