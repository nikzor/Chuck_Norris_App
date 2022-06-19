import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[200],
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
                          TypewriterAnimatedText('text_1'.tr()),
                          TypewriterAnimatedText('text_2'.tr()),
                          TypewriterAnimatedText('text_3'.tr()),
                          TypewriterAnimatedText('text_4'.tr()),
                          TypewriterAnimatedText('text_5'.tr()),
                          TypewriterAnimatedText('text_6'.tr()),
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
    );
  }
}
