// ignore_for_file: unnecessary_new, deprecated_member_use, duplicate_ignore

import 'package:fitnessapp/screens/add_images.dart';
import 'package:fitnessapp/screens/add_videos.dart';
import 'package:fitnessapp/screens/adminimage_screen.dart';
import 'package:fitnessapp/screens/adminvideos_screen.dart';
import 'package:fitnessapp/screens/adminworkoutcategory_screen.dart';
import 'package:flutter/material.dart';

import 'auth/login_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
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
    const Center(child: AdminImageScreen()),
    const Center(
      child: AdminVideoScreen(),
    ),
    const Center(
      child: AdminWorkoutCategoryScreen(),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
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
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GestureDetector(
                onTap: () {},
                child: Image(
                  image: const AssetImage(
                    "assets/gymlogo.jpg",
                  ),
                  width: MediaQuery.of(context).size.width,
                )),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                new ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text("Images"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddImageScreen()));
                  },
                ),
                new ListTile(
                  leading: const Icon(Icons.home_work),
                  title: const Text("Videos"),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddVideoScreen()));
                  },
                ),
              ],
            ),
            const Divider(),
            new ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                String logoutMessage = "Are you sure you want to logout?";
                _showLogoutMessage(logoutMessage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
