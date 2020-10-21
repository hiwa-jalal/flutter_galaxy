import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildPlanetImage('mercury'),
                _buildPlanetImage('venus'),
                _buildPlanetImage('earth'),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: Alignment(-1, -1),
                  child: _buildPlanetImage('mars'),
                ),
                _buildPlanetImage('jupiter'),
                _buildPlanetImage('saturn'),
                _buildPlanetImage('uranus'),
                _buildPlanetImage('neptune'),
              ],
            ),
            SizedBox(height: 100),
            AvatarGlow(
              glowColor: Color(0xff735BA2),
              endRadius: 190,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(180)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Image _buildPlanetImage(String imagePath) {
    return Image.asset(
      'images/$imagePath.png',
      height: 70,
      width: 70,
    );
  }
}
