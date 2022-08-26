// ignore_for_file: sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AdminVideoScreen extends StatefulWidget {
  const AdminVideoScreen({Key? key}) : super(key: key);

  @override
  State<AdminVideoScreen> createState() => _AdminVideoScreenState();
}

class _AdminVideoScreenState extends State<AdminVideoScreen> {
  late String videoId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("videos").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot myPost =
                        (snapshot.data! as QuerySnapshot).docs[index];
                    var url = myPost['url'];
                    videoId = YoutubePlayer.convertUrlToId(url)!;
                    YoutubePlayerController controller =
                        YoutubePlayerController(
                      initialVideoId: videoId,
                      flags: const YoutubePlayerFlags(
                        autoPlay: false,
                        mute: false,
                        disableDragSeek: false,
                        loop: false,
                        isLive: false,
                        forceHD: false,
                      ),
                    );
                    return Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0, bottom: 8.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0,
                                  shadowColor: const Color(0x802196F3),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: YoutubePlayer(
                                                      controller: controller,
                                                      liveUIColor:
                                                          Colors.amber)),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            '${myPost['title']}',
                                            style: const TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.justify,
                                          ),
                                          const SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            '${myPost['description']}',
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueGrey,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection("videos")
                                                    .where("title",
                                                        isEqualTo:
                                                            myPost['title'])
                                                    .get()
                                                    .then((snapshot) => snapshot
                                                        .docs.first.reference
                                                        .delete());
                                              },
                                              icon: const Icon(Icons.delete))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  });
            }
          }),
    );
  }
}
