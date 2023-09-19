import 'package:flutter/material.dart';
import './next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PageOne(),
      // debugShowCheckedModeBanner: false
    );
  }
}

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String buttonText = "Click me";
  int currentIndexNum = 0;
  bool _isClicked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Title"),
      ),
      body: Center(
          child: currentIndexNum == 0
              ? Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.orange),
                        onPressed: () {
                          setState(() {
                            buttonText = "changed";
                          });
                        },
                        child: Text(buttonText),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const PageTwo(),
                            ),
                          );
                        },
                        child: const Text("Next Page"),
                      ),
                    ],
                  ),
                )
              : (currentIndexNum == 1
                  ? GestureDetector(
                    onTap: (){
                      setState(() {
                        _isClicked = !_isClicked;
                      });
                    },
                      child: _isClicked ? Image.asset('images/samsam.jpg') : Image.network("https://upload.wikimedia.org/wikipedia/commons/7/7e/Chess_piece_-_White_king.jpg"),
                    )
                  : Image.network(
                      'https://upload.wikimedia.org/wikipedia/en/4/4d/Shrek_%28character%29.png'))),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "user",
            icon: Icon(Icons.verified),
          ),
          BottomNavigationBarItem(
            label: "music",
            icon: Icon(Icons.audiotrack),
          ),
          BottomNavigationBarItem(
            label: "settings",
            icon: Icon(Icons.settings),
          )
        ],
        currentIndex: currentIndexNum,
        onTap: (int index) {
          setState(() {
            currentIndexNum = index;
          });
        },
      ),
    );
  }
}
