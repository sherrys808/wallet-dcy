import 'package:flutter/material.dart';
import 'package:dcy/data/local_storage/secure_storage.dart';

class SeedImport extends StatefulWidget {
  const SeedImport({Key? key}) : super(key: key);

  @override
  State<SeedImport> createState() => _SeedImportState();
}

class _SeedImportState extends State<SeedImport> {
  final textController = TextEditingController();
  bool isActive = false;
  String seedPhrase = '';

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      setState(() {
        isActive = textController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Import from Seed Phrase',
            style: TextStyle(fontSize: 20, letterSpacing: 0.5),
          ),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: textController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Seed Phrase',
                      hintStyle: const TextStyle(
                          letterSpacing: 0.5, color: Colors.grey),
                      alignLabelWithHint: true,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          textController.clear();
                        },
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: isActive
                  ? () {
                      SecureStorage()
                          .writeSecureData('seedPhrase', textController.text);
                      setState(() {
                        seedPhrase = textController.text;
                      });
                      Navigator.pushReplacementNamed(
                          context, '/viewSeedPhrase');
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: isActive
                      ? const LinearGradient(colors: [
                          Colors.lightBlue,
                          Colors.purple,
                          Colors.pink,
                          Color.fromARGB(255, 211, 150, 115)
                        ])
                      : const LinearGradient(colors: [
                          Color.fromARGB(255, 32, 40, 50),
                          Color.fromARGB(255, 32, 40, 50)
                        ]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: 250,
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text(
                    'Import Wallet',
                    style: TextStyle(
                        fontSize: 20, letterSpacing: 1.5, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
