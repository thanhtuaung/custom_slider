import 'package:custom_slider/custom_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Slider'),
      ),
      body: Center(
        child: SSSlider(
          itemList: const ['3 mins', '15 mins', '1 hour', '24 hours', 'Never'],
          // itemList: const ['1', '2', '3', '4', '5', '6'],
          initialValue: "15 mins",
          uniqueValue: (item) => item,
          itemAsString: (item) => item.toString(),
          valueChanged: (item) => print(
            item.toString(),
          ),
          // activeColor: Colors.red,
          activeTrickMarkColor: Colors.black,
          inActiveTrickMarkColor: Colors.red,
          inActiveTrackColor: Colors.green,
          activeTrackColor: Colors.red,
          trickMarkShape: TrickMarkShapes.diamond,
        ),
      ),
    );
  }
}
