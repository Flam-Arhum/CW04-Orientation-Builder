import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI',
      debugShowCheckedModeBanner: false, // Remove the debug label
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive UI'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          // Generate a list of numbers from 1 to 20
          final numbers = List.generate(20, (index) => index + 1);

          // Set background colors
          final bgColor = orientation == Orientation.portrait
              ? Colors.lightBlue[100]
              : Colors.lightGreen[100];

          return Container(
            color: bgColor, // Set the background color
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 1 : 2,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 4.0,
              ),
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Center(child: Text('${numbers[index]}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
