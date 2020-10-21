import 'dart:async';

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
      debugShowCheckedModeBanner: false,
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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var _marsTop = 140.0;
  var _animatedHeight = 100.0;
  var _saturnHeigh = 100.0;
  var _earthRight = 34.0;
  var _saturnLeft = 90.0;
  var _saturnTop = 620.0;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 15),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Positioned.fill(
                child: InkWell(
                  onTap: () => setState(() {
                    _marsTop = 400;
                    _animatedHeight = 0;
                    _earthRight = 250;
                    _animationController.repeat();
                    Future.delayed(
                      Duration(seconds: 7),
                      () => setState(() => _animationController.stop()),
                    );
                  }),
                  child: RotationTransition(
                    turns: _animationController,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/galaxy.png',
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                top: _marsTop,
                left: 260,
                duration: Duration(seconds: 2),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 2400),
                  height: _animatedHeight,
                  child: _buildPlanetImage('mercury'),
                ),
              ),
              Positioned(
                right: 44,
                top: 250,
                child: _buildPlanetImage('venus'),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 2),
                right: _earthRight,
                top: 450,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 2400),
                  height: _animatedHeight,
                  child: _buildPlanetImage('earth'),
                ),
              ),
              Positioned(
                right: 90,
                top: 620,
                child: _buildPlanetImage('mars'),
              ),
              // _buildPlanetImage('mars', 260),
              Positioned(
                bottom: 130,
                right: 260,
                child: _buildPlanetImage('jupiter'),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 2),
                left: _saturnLeft,
                top: _saturnTop,
                child: GestureDetector(
                  onTap: () => setState(() {
                    _saturnTop = 500;
                    Future.delayed(
                      Duration(milliseconds: 1500),
                      () => setState(() {
                        _saturnTop = 400;
                        _saturnLeft = 250;
                        _saturnHeigh = 0;
                      }),
                    );
                  }),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 2400),
                    height: _saturnHeigh,
                    child: _buildPlanetImage('saturn'),
                  ),
                ),
              ),
              Positioned(
                left: 34,
                top: 450,
                child: _buildPlanetImage('uranus'),
              ),
              Positioned(
                left: 44,
                top: 250,
                child: _buildPlanetImage('neptune'),
              ),
              // Positioned.fill(
              //   child: GestureDetector(
              //     onTap: () => setState(() => _marsTop += 250),
              //     child: AvatarGlow(
              //       glowColor: Color(0xff735BA2),
              //       endRadius: 190,
              //       child: Container(
              //         height: 200,
              //         width: 200,
              //         decoration: BoxDecoration(
              //           color: Colors.black,
              //           borderRadius: BorderRadius.all(Radius.circular(180)),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanetImage(String imagePath) {
    return Image.asset(
      'images/$imagePath.png',
      height: 90,
      width: 90,
    );
  }
}
