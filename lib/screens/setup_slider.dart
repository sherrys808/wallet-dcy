import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SetupSlider extends StatefulWidget {
  const SetupSlider({Key? key}) : super(key: key);

  @override
  _SetupSliderState createState() => _SetupSliderState();
}

class _SetupSliderState extends State<SetupSlider> {
  List<Slide> slides = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Expanded(
          child: IntroSlider(
            slides: slides,
            colorActiveDot: Colors.blue,
            colorDot: Colors.grey,
            showNextBtn: false,
            showSkipBtn: false,
            showPrevBtn: false,
            showDoneBtn: false,
          ),
        ),
        SizedBox(
          width: 300,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 32, 40, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/setupWallet');
            },
            child: const Text(
              'Get Started',
              style: TextStyle(fontSize: 20, letterSpacing: 1.5),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        centerWidget: Column(
          children: [
            Image.asset('assets/diversity.png'),
            const SizedBox(
              width: 300,
              height: 50,
            ),
            GradientText(
              "Property",
              colors: [
                Colors.lightBlue,
                Colors.purple.shade200,
                Colors.pink,
                const Color.fromARGB(255, 211, 150, 115),
              ],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            const Text(
              'Diversity',
              style: TextStyle(fontSize: 50, color: Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
    slides.add(
      Slide(
        heightImage: 300,
        widthImage: 300,
        styleDescription: const TextStyle(fontSize: 300),
        centerWidget: Column(
          children: [
            Image.asset('assets/security.png'),
            const SizedBox(
              width: 300,
              height: 50,
            ),
            GradientText(
              "Safe",
              colors: [
                Colors.lightBlue,
                Colors.purple.shade200,
                Colors.pink,
                const Color.fromARGB(255, 211, 150, 115),
              ],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            const Text(
              'Security',
              style: TextStyle(fontSize: 50, color: Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
    slides.add(
      Slide(
        heightImage: 300,
        widthImage: 300,
        styleDescription: const TextStyle(fontSize: 300),
        centerWidget: Column(
          children: [
            Image.asset('assets/diversity.png'),
            const SizedBox(
              width: 300,
              height: 50,
            ),
            GradientText(
              "Convenient",
              colors: [
                Colors.lightBlue,
                Colors.purple.shade200,
                Colors.pink,
                const Color.fromARGB(255, 211, 150, 115),
              ],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            const Text(
              'Transaction',
              style: TextStyle(fontSize: 50, color: Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
