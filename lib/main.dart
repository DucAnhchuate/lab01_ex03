import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget > createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int id = 1;
  bool enableButton = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Flutter Image Viewer",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              leading:  IconButton(
                icon: const Icon(Icons.arrow_back,
                  color: Colors.white),
                onPressed: () {
                  print("Disable floating button");
                  setState(() {
                    enableButton = !enableButton;
                  });
                },
              ),
              actions: const [Icon(
                Icons.more_vert,
                color: Colors.white,
              )],
              backgroundColor: Colors.blue,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: enableButton? (){
                setState(() {
                  id = id + 1;
                  print("Clicked, id = $id");
                });
              } : null,
              child: Icon(Icons.change_circle),
            ),
            body: Center(
              child: enableButton ? Image.network("https://picsum.photos/250?image=$id"): Image.asset('assets/stop.jpeg'),
            )
        )
    );
  }
}
