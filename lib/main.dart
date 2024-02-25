import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff9ced3e),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('To-Do List'),
          backgroundColor: Colors.blue, // Adjust as needed
          elevation: 0, // Removes the shadow
          toolbarHeight: 80, // Adjust as needed
        ),
        body: const ClickAbleLists(),
      ),
    );
  }
}

class ClickAbleLists extends StatefulWidget {
  const ClickAbleLists({super.key});

  @override
  State<ClickAbleLists> createState() => _ClickAbleState();
}

class _ClickAbleState extends State<ClickAbleLists> {
  bool isClicked1 = false;
  bool isClicked2 = false;
  bool isClicked3 = false;
  bool isClicked4 = false;
  bool isClicked5 = false;
  bool isClicked6 = false;
  bool isClicked7 = false;
  bool isClicked8 = false;
  bool isClicked9 = false;
  bool isClicked10 = false;
  bool isClicked11 = false;
  bool isClicked12 = false;
  bool isClicked13 = false;
  bool isClicked14 = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text('Go To Mega City'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked1 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked1 = !isClicked1;
                  });
                },
                child: isClicked1
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Cut Dave @ 1'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked2 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked2 = !isClicked2;
                  });
                },
                child: isClicked2
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Get Money For Clothes'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked3 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked3 = !isClicked3;
                  });
                },
                child: isClicked3
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('STUDY REAL ANALYSIS'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked4 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked4 = !isClicked4;
                  });
                },
                child: isClicked4
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('PUSH CODING CONTENT'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked5 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked5 = !isClicked5;
                  });
                },
                child: isClicked5
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('QUICK NAP'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked6 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked6 = !isClicked6;
                  });
                },
                child: isClicked6
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('DO WASHING'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked7 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked7 = !isClicked7;
                  });
                },
                child: isClicked7
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('CALL MY GIRL'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked8 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked8 = !isClicked8;
                  });
                },
                child: isClicked8
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('SPOIL MYSELF'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked9 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked9 = !isClicked9;
                  });
                },
                child: isClicked9
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('CUT SER DAVOS'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked10 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked10 = !isClicked10;
                  });
                },
                child: isClicked10
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('40 MINUTES BREAK'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked11 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked11 = !isClicked11;
                  });
                },
                child: isClicked11
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('WATCH ANIME'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked12 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked12 = !isClicked12;
                  });
                },
                child: isClicked12
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('COOK'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked14 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked13 = !isClicked13;
                  });
                },
                child: isClicked14
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('WATCH FOOTBALL'),
              leading: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked13 = true;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    isClicked14 = !isClicked14;
                  });
                },
                child: isClicked13
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.circle_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
