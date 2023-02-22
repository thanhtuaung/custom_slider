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
      debugShowCheckedModeBanner: false,
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Slider"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SSCustomSlider<String>(
              itemList: const ['1', '2', '3', '4', '5'],
              // itemList: const ['1', '2', '3', '4', '5', '6'],
              initialValue: "15 mins",
              uniqueValue: (item) => item,
              itemAsString: (item) => item.toString(),
              valueChanged: (item) => print(
                item.toString(),
              ),
              // activeColor: Colors.red,
              activeTrickMarkColor: Colors.red,
              inActiveTrickMarkColor: Colors.red,
              activeTrackColor: Colors.red,
              trickMarkSize: 5,
              trickMarkShape: TrickMarkShapes.circle,
              // inActiveColor: Colors.red,
            ),
            const Spacer(),
            SSCustomSlider<String>(
              itemList: const ['Jan', 'Feb', 'March', 'April', 'May'],
              // itemList: const ['1', '2', '3', '4', '5', '6'],
              initialValue: "15 mins",
              uniqueValue: (item) => item,
              itemAsString: (item) => item.toString(),
              valueChanged: (item) => print(
                item.toString(),
              ),
              // activeColor: Colors.red,
              activeTrickMarkColor: Colors.red,
              inActiveTrickMarkColor: Colors.red,
              activeTrackColor: Colors.red,
              trickMarkSize: 7,
              trickMarkShape: TrickMarkShapes.diamond,
              // inActiveColor: Colors.red,
            ),
            const Spacer(),
            SSCustomSlider<String>(
              itemList: const ['1', '2', '3 mins', '4 hours', '24 hours'],
              // itemList: const ['1', '2', '3', '4', '5', '6'],
              initialValue: "15 mins",
              uniqueValue: (item) => item,
              itemAsString: (item) => item.toString(),
              valueChanged: (item) => print(
                item.toString(),
              ),
              // activeColor: Colors.red,
              activeTrickMarkColor: Colors.red,
              inActiveTrickMarkColor: Colors.red,
              activeTrackColor: Colors.red,
              trickMarkShape: TrickMarkShapes.square,
              // inActiveColor: Colors.red,
            ),
            const Spacer(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
