import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:math';

class Joke {
  final String value;

  const Joke({
    required this.value,
  });
}

class TinderWidget extends StatefulWidget {
  const TinderWidget({Key? key}) : super(key: key);

  @override
  State<TinderWidget> createState() => _TinderWidgetState();
}

class _TinderWidgetState extends State<TinderWidget> {
  String joke = "Not actually a joke";
  String numOfChuck = "1";
  Random random = Random();
  void _getJoke() async {
    Dio dio = Dio();
    Response response =
        await dio.get("https://api.chucknorris.io/jokes/random");
    setState(() {
      joke = response.data['value'];
      numOfChuck = (random.nextInt(8) + 1).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('What about good joke?'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        // backgroundColor: Colors.orange[500],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  if (details.primaryVelocity! < 0) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context),
                    );
                  } else if (details.primaryVelocity! > 0) {
                    setState(() {
                      _getJoke();
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    border: Border.all(
                      width: 3,
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  width: 300,
                  height: 500,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: Image.asset(
                            "assets/images/chuck_$numOfChuck.png",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 290,
                            height: 175,
                            child: ListView(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              children: [
                                Text(
                                  joke,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              _buildPopupDialog(context),
                        );
                      },
                      icon: const Icon(Icons.thumb_down),
                    ),
                    IconButton(
                      onPressed: _getJoke,
                      icon: const Icon(Icons.thumb_up),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Oh man, you made a mistake!'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Nobody can dislike CHUCK!!!"),
      ],
    ),
    actions: <Widget>[
      MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
