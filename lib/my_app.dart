import 'package:chuck_norris_app/screens/about.dart';
import 'package:chuck_norris_app/screens/favourite.dart';
import 'package:chuck_norris_app/screens/home.dart';
import 'package:chuck_norris_app/screens/tinder.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: "/",
      routes: {
        '/': (_) => const HomeWidget(),
        '/tinder': (_) => const Tinder(),
        '/about': (_) => const AboutWidget(),
        '/favourite': (_) => const Favourite(),
      },
    );
  }
}
