import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  void getSeed(BuildContext context) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    String? seedPhrase = await storage.read(key: "seedPhrase");
    String? walletCreated = await storage.read(key: "walletCreated");
    print("Seed Phrase: $seedPhrase");
    if (seedPhrase != null && seedPhrase.isNotEmpty) {
      print('Seed Found');
      Navigator.pushReplacementNamed(context, '/viewSeedPhrase');
    } else if (walletCreated != null && walletCreated.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/createWallet');
    } else {
      print('Seed not Found');
      Navigator.pushReplacementNamed(context, '/setupSlider');
    }
  }

  Future<void> startTimer(BuildContext context) async {
    Timer(const Duration(seconds: 3), () {
      getSeed(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startTimer(context);
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientText(
                "DCY",
                colors: [
                  Colors.lightBlue,
                  Colors.purple.shade200,
                  Colors.pink,
                  const Color.fromARGB(255, 211, 150, 115),
                ],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
              ),
              const Text(
                'CRYPTO WALLET',
                style: TextStyle(fontSize: 25, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
