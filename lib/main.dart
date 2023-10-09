import 'package:dcy/screens/create_wallet.dart';
import 'package:dcy/screens/import_seed.dart';
import 'package:dcy/screens/seed_phrase.dart';
import 'package:dcy/screens/wallet_setup.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'screens/splash.dart';
import 'screens/setup_slider.dart';

void main() {
  runApp(const MyApp());
}

List<Slide> slides = [];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Archivo'),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/setupSlider': (context) => const SetupSlider(),
        '/setupWallet': (context) => const WalletSetup(),
        '/importSeed': (context) => const SeedImport(),
        '/viewSeedPhrase': (context) => const SeedPhrase(),
        '/createWallet': (context) => const CreateWallet(),
      },
    );
  }
}
