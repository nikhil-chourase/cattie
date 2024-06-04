


import 'package:cattie/constants.dart';
import 'package:cattie/views/screens/add_video_screen.dart';
import 'package:cattie/views/screens/comment_screen.dart';
import 'package:cattie/views/widgets/video_player_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../controllers/video_controller.dart';

class VideoScreen extends StatelessWidget {

  static String id = 'VideoScreen';




  final VideoController videoController = Get.put(VideoController());

  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(children: [
        Positioned(
          left: 5,
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ]),
    );
  }

  //late VideoPlayerController videoPlayerController;

  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;



    return Scaffold(
      backgroundColor: Colors.black,
      // appBar:AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Color(0xff202534),
      //   elevation: 0, // Remove the shadow
      //   title: Row(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(left: 10),
      //         child: Container(),
      //       ),
      //       SizedBox(width: 8),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.cast,
      //         color: Colors.black,
      //       ),
      //       onPressed: () {
      //         // Handle cast button press
      //       },
      //     ),
      //     IconButton(
      //       icon: Icon(
      //         Icons.search,
      //         color: Colors.black,
      //       ),
      //       onPressed: () {
      //         // Handle search button press
      //       },
      //     ),
      //     IconButton(
      //       icon: Icon(
      //         Icons.more_vert,
      //         color: Colors.black,
      //       ),
      //       onPressed: () {
      //         showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return AlertDialog(
      //               title: Text('Logout'),
      //               content: Text('Are you sure you want to logout?'),
      //               actions: [
      //                 TextButton(
      //                   child: Text('Cancel'),
      //                   onPressed: () {
      //                     Navigator.of(context).pop(); // Close the dialog
      //                   },
      //                 ),
      //                 TextButton(
      //                   child: Text('Logout'),
      //                   onPressed: () async{
      //                     // Perform logout logic here
      //                     await GoogleSignIn().signOut();
      //                     Navigator.pop(context);
      //                     Navigator.of(context).pop(); // Close the dialog
      //                   },
      //                 ),
      //               ],
      //             );
      //           },
      //         );
      //         // Handle more button press
      //       },
      //     ),
      //   ],
      // )
      // ,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, AddVideoScreen.id);
      //
      //   },
      //   backgroundColor: Colors.transparent,
      //   child: const Icon(
      //     Icons.add,
      //     size: 40,
      //     color: Colors.white,
      //   ),
      // ),

      body: Obx(
              () {

            return PageView.builder(
              itemCount: videoController.videoList.length,
              controller: PageController(viewportFraction: 1,initialPage: 0),
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index){
                final data = videoController.videoList[index];
                return Stack(
                  children: [
                    VideoPlayerItem(videoUrl: data.videoUrl,),

                    Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 20.0,top: 400),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          data.username,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          data.caption,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.music_note,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              data.songName,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],

                                    ),
                                  )
                              ),
                              Container(
                                width: 100,
                                margin: EdgeInsets.only(top: size.height/5,bottom: 100),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    buildProfile(
                                      data.profilePhoto,
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () =>  videoController.likeVideo(data.id)
                                          ,
                                          child: Icon(
                                            Icons.favorite,
                                            size: 40,
                                            color: data.likes.contains(authService.user.uid)?
                                            Colors.red: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 7),
                                        Text(
                                          data.likes.length.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                              return CommentScreen(
                                                Id: data.id,
                                              );

                                            }));
                                          },
                                          child: const Icon(
                                            Icons.comment,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 7),
                                        Text(
                                          data.commentCount.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.reply,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 7),

                                      ],
                                    ),


                                  ],
                                ),
                              )
                            ],

                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          }
      ),

    );
  }
}
