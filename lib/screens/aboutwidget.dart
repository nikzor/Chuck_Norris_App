import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.orange[200],
        appBar: null,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  'assets/images/chuck_1.png',
                  width: 250,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 16,
                    right: 16,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: DefaultTextStyle(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText('Hello'),
                          TypewriterAnimatedText('My name is Nikita'),
                          TypewriterAnimatedText(
                              'This is my first Flutter application'),
                          TypewriterAnimatedText('Where is my applouses?'),
                          TypewriterAnimatedText('You should go back home!'),
                          TypewriterAnimatedText('Loading...'),
                        ],
                        onFinished: () {
                          Navigator.pushNamed(context, '/');
                        },
                        isRepeatingAnimation: false,
                        pause: const Duration(milliseconds: 1500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
