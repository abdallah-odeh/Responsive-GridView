import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_responsive_grid/flutter_responsive_grid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Responsive grid list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> randomString = [
    "Text",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    "Hello world",
    "Flutter developers",
    "This image is awesome"
  ];
  final List<String> randomImage = [
    "https://imgd.aeplcdn.com/642x361/n/bw/models/colors/royal-enfield-classic-350-redditch-red-1551179665398.jpg?q=80",
    "https://i.pinimg.com/236x/26/c0/de/26c0def016a944a8685e3c1b21a7d7d3.jpg",
    "https://static.toiimg.com/photo/72975551.cms",
    "https://previews.123rf.com/images/abbphoto/abbphoto1710/abbphoto171000100/88075782-pathway-in-the-finnish-forest-finland-nature-background-vertical.jpg",
    "https://i.pinimg.com/originals/7a/cc/15/7acc1584594b6fc6b914489e0278dd58.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    var generator = new Random();

    final List<Widget> children = [
      for (int i = 0; i < (generator.nextInt(15)) + 5; i++)
        Card(
          child: Column(
            children: [
              Image.network(randomImage[generator.nextInt(4)]),
              SizedBox(height: 4),
              Text(
                randomString[generator.nextInt(4)],
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              )
            ],
          ),
        ),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ResponsiveGrid(
          children: children,
          columns: 3,
          sizeBetween: 8.0
        ),
      ),
    );
  }
}
