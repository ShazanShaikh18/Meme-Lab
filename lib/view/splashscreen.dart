import 'package:flutter/material.dart';
import 'package:memes_app/view/mainscreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(
      Duration(seconds: 3),
      () {},
    );
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset('assets/images/meme.png'),
          SizedBox(
            height: 50,
          ),
          Text(
            'Welcome to Memes World!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }
}
