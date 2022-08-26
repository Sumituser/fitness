// ignore_for_file: depend_on_referenced_packages, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddVideoScreen extends StatefulWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  @override
  State<AddVideoScreen> createState() => _AddVideoScreenState();
}

class _AddVideoScreenState extends State<AddVideoScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final TextEditingController _videoController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  void _showSuccessfulMessage(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text("From Fitness App"),
              content: Text(msg),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Okay"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text("ADD VIDEOS"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: _videoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Video Url',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Enter Video Url";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter title',
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Enter title";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter description',
                        ),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Enter Description";
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        // color: Colors.black,
                        // textColor: Colors.white,
                        onPressed: () async {
                          var message = "Image Added Successfully";
                          if (!_formkey.currentState!.validate()) {
                            return;
                          }
                          _formkey.currentState!.save();
                          try {
                            Map<String, dynamic> data = {
                              "url": _videoController.text,
                              "title": _titleController.text,
                              "description": _descriptionController.text,
                            };
                            FirebaseFirestore.instance
                                .collection("videos")
                                .add(data)
                                .then(
                                    (value) => _showSuccessfulMessage(message));
                          } catch (error) {
                            rethrow;
                          }
                        },
                        child: const Text("Save")),
                  )
                ]),
          ),
        ));
  }
}
