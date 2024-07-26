import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  bool _isEnglish = true;
  String _actualLang = 'EN';

  void _setLang() async {
    if (_isEnglish) {
      setState(() {
        _isEnglish = false;
        _actualLang = 'RU';
      });
      await context.setLocale(const Locale('ru'));
    } else {
      setState(() {
        _isEnglish = true;
        _actualLang = 'EN';
      });
      await context.setLocale(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.orange[500],
        overlayColor: Colors.transparent,
        overlayOpacity: 0.2,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.favorite),
            label: 'favourite'.tr(),
            onTap: () => Navigator.pushNamed(context, '/favourite'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.help),
            label: 'about'.tr(),
            onTap: () => Navigator.pushNamed(context, '/about'),
          ),
          SpeedDialChild(
            child: const Icon(Icons.emoji_flags),
            label: _actualLang,
            onTap: () => _setLang(),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/chuck.png',
                width: 250,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.orange[500],
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/tinder');
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      "start".tr(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
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
