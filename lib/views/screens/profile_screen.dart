
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cattie/constants.dart';
import 'package:cattie/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {

  final String uid;
  ProfileScreen({super.key, required this.uid});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.updateUserId(widget.uid);
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {

        if(controller.user.isEmpty){
          return const Center(
              child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black12,
            leading: Icon(
              Icons.person_add_alt_1_outlined,
            ),
            actions: [
              Icon(Icons.more_horiz),
            ],
            title: Center(child: Text(controller.user['name'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

          ),
          body: SafeArea(
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: controller.user['profilePhoto'],
                            height: 100,
                            width: 100,
                            placeholder: (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url,error) => Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(controller.user['following'],style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 5,),
                              const Text('following',style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),),
                            ],
                          ),

                          Column(
                            children: [
                              Text(controller.user['followers'],style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 5,),
                              const Text('followers',style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),),
                            ],
                          ),

                          Column(
                            children: [
                              Text(controller.user['likes'],style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 5,),
                              const Text('likes',style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),),
                            ],
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    Container(
                      width: 140,
                      height: 47,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12
                        )
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () async {
                            if(widget.uid == authService.user.uid){
                              await GoogleSignIn().signOut();
                              Navigator.of(context).pop();
                            }else{
                              controller.followUser();
                            }


                          },
                            child: Text(
                              widget.uid == authService.user.uid ? 'Sign Out': controller.user['isFollowing'] ? 'Unfollow': 'follow',
                            )),
                      ),
                    )
                  ],
                )
              ],
            ),
          )

        );
      }
    );
  }
}
