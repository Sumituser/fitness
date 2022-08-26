// ignore_for_file: unnecessary_new, deprecated_member_use, duplicate_ignore
import 'package:fitnessapp/screens/uservideo_screen.dart';
import 'package:fitnessapp/screens/workoutcategory_screen.dart';
import 'package:flutter/material.dart';

import 'auth/login_screen.dart';
import 'image_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _showLogoutMessage(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('From Mr.Fitness Gym'),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
          ),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  final tabs = [
    const Center(child: ImageScreen()),
    const Center(
      child: UserVideoScreen(),
    ),
    const Center(
      child: WorkoutCategoryScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var items2 = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        backgroundColor: Colors.blue,
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.video_collection),
        label: 'Video',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.fitness_center),
        label: 'Workout',
        backgroundColor: Colors.blue,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        //automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("FITNESS APP"),
        actions: [
          IconButton(
              onPressed: () {
                String msg = "Are You Sure, You Want To Logout ?";
                _showLogoutMessage(msg);
              },
              icon: const Icon(Icons.login_sharp))
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: items2,
        onTap: (
          index,
        ) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
