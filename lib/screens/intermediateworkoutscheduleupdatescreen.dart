// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IntermediateWorkoutScheduleUploadScreen extends StatefulWidget {
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String sunday;
  // ignore: prefer_const_constructors_in_immutables
  IntermediateWorkoutScheduleUploadScreen({
    Key? key,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _IntermediateWorkoutScheduleUploadScreenState createState() =>
      _IntermediateWorkoutScheduleUploadScreenState();
}

class _IntermediateWorkoutScheduleUploadScreenState
    extends State<IntermediateWorkoutScheduleUploadScreen> {
  late String monday, tuesday, wednesday, thursday, friday, saturday, sunday;
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _showSuccessfulMessage(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('From Mr.Fitness gym'),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Update Beginner Schedule"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.monday,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter monday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  monday = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Enter monday ',
                  hintStyle: const TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.tuesday,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter tuesday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  tuesday = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Enter tuesday workout ',
                  hintStyle: const TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.wednesday,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter wednesday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  wednesday = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Enter wednesday workout ',
                  hintStyle: const TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.thursday,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter thursday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  thursday = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Enter thursday workout ',
                  hintStyle: const TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.friday,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter friday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  friday = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Enter friday workout ',
                  hintStyle: const TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.saturday,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter saturday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  saturday = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Enter saturday workout ',
                  hintStyle: const TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: widget.sunday,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter sunday workout';
                  }
                  return null;
                },
                onSaved: (value) {
                  sunday = value!;
                },
                decoration: InputDecoration(
                  hintText: 'Enter sunday workout ',
                  hintStyle: const TextStyle(
                    letterSpacing: 2,
                    color: Colors.black54,
                  ),
                  fillColor: Colors.white30,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                _formKey.currentState!.save();
                await FirebaseFirestore.instance
                    .collection("intermediateschedule")
                    .get()
                    .then((snapshot) => snapshot.docs.first.reference.delete());
                Map<String, dynamic> data = {
                  "day1": monday,
                  "day2": tuesday,
                  "day3": wednesday,
                  "day4": thursday,
                  "day5": friday,
                  "day6": saturday,
                  "day7": sunday,
                };
                String successfulMessage =
                    "Intermediate schedule was successfully updated";
                FirebaseFirestore.instance
                    .collection("intermediateschedule")
                    .add(data)
                    .then((value) => _showSuccessfulMessage(successfulMessage));
              },
              //  color: Colors.red.shade400,
              child: const Text("Update"),
            )
          ]),
        ),
      ),
    );
  }
}
