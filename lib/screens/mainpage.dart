import 'package:API/api/api1.dart';
import 'package:API/api/api2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  List pages = [
    const api1(),
    const api2(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Column(
            children: [
              BottomNavigationBar(
                iconSize: 30,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                onTap: onTap,
                currentIndex: currentIndex,
                selectedItemColor: Color.fromRGBO(89, 139, 237, 1),
                unselectedItemColor: Color.fromRGBO(109, 116, 122, 1),
                elevation: 1,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.api_outlined), label: 'API-1'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.data_object_rounded), label: 'API-2'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
