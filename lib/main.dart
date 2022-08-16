import 'package:flutter/material.dart';

import 'package:mobile_sqlite/menu/home_page.dart';
import 'package:mobile_sqlite/menu/discovery_page.dart';
import 'package:mobile_sqlite/menu/libarry_page.dart';
import 'package:mobile_sqlite/menu/feed_page.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(MultiProvider(providers: [
  //   ChangeNotifierProvider(create: (_) => CovidTrackerService())
  // ], child: MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final tabs = [/*HomePage(),*/ DiscoveryPage(), LibraryPage(), FeedPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 35,
        items: [
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.home),
          //     label: 'Home',
          //     backgroundColor: Colors.greenAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_pin),
              label: 'Discovery',
              backgroundColor: Colors.green),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Library',
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Feed',
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
