import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CreateWallet extends StatelessWidget {
  const CreateWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const FlutterSecureStorage storage = FlutterSecureStorage();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientText(
                "Wallet Created",
                colors: [
                  Colors.lightBlue,
                  Colors.purple.shade200,
                  Colors.pink,
                  const Color.fromARGB(255, 211, 150, 115),
                ],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              IconButton(
                iconSize: 30,
                icon: const Icon(
                  Icons.clear,
                  color: Colors.grey,
                ),
                onPressed: () async {
                  await storage.deleteAll();
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
