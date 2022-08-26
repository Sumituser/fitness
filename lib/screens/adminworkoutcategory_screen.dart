import 'package:fitnessapp/screens/adminbeginnerworkoutschedule_screen.dart';
import 'package:fitnessapp/screens/adminexpertworkoutschedule_screen.dart';
import 'package:fitnessapp/screens/adminintermediateworkoutschedule_acreen.dart';
import 'package:flutter/material.dart';

class AdminWorkoutCategoryScreen extends StatefulWidget {
  const AdminWorkoutCategoryScreen({Key? key}) : super(key: key);
  @override
  State<AdminWorkoutCategoryScreen> createState() =>
      _AdminWorkoutCategoryScreenState();
}

class _AdminWorkoutCategoryScreenState
    extends State<AdminWorkoutCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Ink.image(
                        image: const AssetImage("assets/beginner.jpg"),
                        height: 240,
                        fit: BoxFit.fill,
                        child: InkWell(onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AdminBeginnerWorkoutScheduleScreen()));
                        }),
                      ),
                    ),
                    const Text(
                      'Beginner',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24),
                    )
                  ],
                ),
              ),
            ),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Ink.image(
                      image: const AssetImage("assets/intermediate.jpg"),
                      height: 240,
                      fit: BoxFit.fill,
                      child: InkWell(onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AdminIntermediateWorkoutScheduleScreen()));
                      }),
                    ),
                  ),
                  const Text(
                    'Intermediate',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Ink.image(
                      image: const AssetImage("assets/expert.jpg"),
                      height: 240,
                      fit: BoxFit.fill,
                      child: InkWell(onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AdminExpertWorkoutScheduleScreen()));
                      }),
                    ),
                  ),
                  const Text(
                    'Advanced',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 24),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
