import 'package:flutter/material.dart';
import 'package:dcy/data/local_storage/secure_storage.dart';

class WalletSetup extends StatelessWidget {
  const WalletSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [      
        Image.asset('assets/wallet.png'),
        const SizedBox(
          height: 40,
          width: 300,
        ),
        const Text(
          'Wallet Setup',
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
        
        Column(
          children: [
          SizedBox(
          width: 300,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 32, 40, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/importSeed');
            },
            child: const Text(
              'Import Using Seed Phrase',
              style: TextStyle(fontSize: 20, letterSpacing: 1.5),
            ),
          ),
        ),
        const SizedBox(height: 18,),
           ElevatedButton(
          onPressed: () async {
            Navigator.pushReplacementNamed(context, '/createWallet');
            await SecureStorage()
              .writeSecureData('walletCreated', 'true');
            
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Colors.lightBlue,
                Colors.purple,
                Colors.pink,
                Color.fromARGB(255, 211, 150, 115)
              ]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 300,
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                'Create a New Wallet',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ),
        ],)
       
      ],
    ));
  }
}
