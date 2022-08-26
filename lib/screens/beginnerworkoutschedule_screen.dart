// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BeginnerWorkoutScheduleScreen extends StatefulWidget {
  const BeginnerWorkoutScheduleScreen({Key? key}) : super(key: key);

  @override
  State<BeginnerWorkoutScheduleScreen> createState() =>
      _BeginnerWorkoutScheduleScreenState();
}

class _BeginnerWorkoutScheduleScreenState
    extends State<BeginnerWorkoutScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("BEGINNER SCHEDULE"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('beginnerschedule')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot myPost =
                      (snapshot.data! as QuerySnapshot).docs[index];
                  return Stack(
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: DataTable(
                              dataRowColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.08);
                                }
                                return Colors.red.shade200;
                                //Use the default value.
                              }),
                              columns: [
                                const DataColumn(
                                    label: Text('',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))),
                                const DataColumn(
                                    label: Text('',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))),
                              ],
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text(
                                    'Monday',
                                    style: TextStyle(fontSize: 15.0),
                                  )),
                                  DataCell(Text(
                                    myPost['day1'],
                                    style: const TextStyle(fontSize: 15.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text(
                                    'Tuesday',
                                    style: TextStyle(fontSize: 15.0),
                                  )),
                                  DataCell(Text(
                                    myPost['day2'],
                                    style: const TextStyle(fontSize: 15.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(
                                    Text(
                                      'Wednesday',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ),
                                  DataCell(Text(
                                    myPost['day3'],
                                    style: const TextStyle(fontSize: 15.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text(
                                    'Thrusday',
                                    style: TextStyle(fontSize: 15.0),
                                  )),
                                  DataCell(Text(
                                    myPost['day4'],
                                    style: const TextStyle(fontSize: 15.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text(
                                    'Friday',
                                    style: TextStyle(fontSize: 15.0),
                                  )),
                                  DataCell(Text(
                                    myPost['day5'],
                                    style: const TextStyle(fontSize: 15.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text(
                                    'Saturday',
                                    style: TextStyle(fontSize: 15.0),
                                  )),
                                  DataCell(Text(
                                    myPost['day6'],
                                    style: const TextStyle(fontSize: 15.0),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text(
                                    'Sunday',
                                    style: TextStyle(fontSize: 15.0),
                                  )),
                                  DataCell(Text(
                                    myPost['day7'],
                                    style: const TextStyle(fontSize: 15.0),
                                  )),
                                ]),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                });
          }
        },
      ),
    );
  }
}
