import 'package:fitnessapp/screens/beginnerworkoutschedule_screen.dart';
import 'package:fitnessapp/screens/expertworkoutschedule_screen.dart';
import 'package:fitnessapp/screens/intermediateworkoutschedule_screen.dart';
import 'package:flutter/material.dart';

class WorkoutCategoryScreen extends StatefulWidget {
  const WorkoutCategoryScreen({Key? key}) : super(key: key);
  @override
  State<WorkoutCategoryScreen> createState() => _WorkoutCategoryScreenState();
}

class _WorkoutCategoryScreenState extends State<WorkoutCategoryScreen> {
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
                                      const BeginnerWorkoutScheduleScreen()));
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
                                    const IntermediateWorkoutScheduleScreen()));
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
                                    const ExpertWorkoutScheduleScreen()));
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
