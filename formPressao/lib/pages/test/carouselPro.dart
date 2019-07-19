import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Carousel',
      home: HomePageIn(),
    );
  }
}

class HomePageIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageCarousel()
    );
  }
}

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        height: screenHeight/2,
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            AssetImage('assets/images/good-health.jpg'),
            AssetImage('assets/images/alimentos-saudaveis.jpg'),
            AssetImage('assets/images/vida-saudavel.jpg')
          ],
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(seconds: 2),
          
        ),
      ),
    );
  }
}