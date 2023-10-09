import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SeedPhrase extends StatefulWidget {
  const SeedPhrase({super.key});

  @override
  State<SeedPhrase> createState() => _SeedPhraseState();
}

class _SeedPhraseState extends State<SeedPhrase> {
  String seed = "";
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    getSeed();
  }

  getSeed() async {
    final seedValue = await storage.read(key: "seedPhrase");
    if (seedValue != null) {
      setState(() {
        seed = seedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your Seed Phrase is',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              GradientText(
                seed,
                colors: [
                  Colors.lightBlue,
                  Colors.purple.shade200,
                  Colors.pink,
                  const Color.fromARGB(255, 211, 150, 115),
                ],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              const SizedBox(
                height: 50,
              ),
              IconButton(
                iconSize: 30,
                icon: const Icon(
                  Icons.clear,
                  color: Colors.grey,
                ),
                onPressed: () {
                  storage.deleteAll();
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
