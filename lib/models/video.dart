// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  late String username;
  late String uid;
  late String id;
  late List likes;
  late int commentCount;
  late String songName;
  late String caption;
  late String videoUrl;
  late String profilePhoto;

  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.profilePhoto,
  });




  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "id": id,
    "likes": likes,
    "commentCount": commentCount,
    "songName": songName,
    "caption": caption,
    "videoUrl": videoUrl,
    "profilePhoto": profilePhoto,

  };


  static Video fromSnap(DocumentSnapshot snap){

    var snapshot = snap.data() as Map<String, dynamic>;


    return Video(
      username: snapshot['username'],
      uid: snapshot['uid'],
      id: snapshot['id'],
      likes: snapshot['likes'],
      commentCount: snapshot['commentCount'],
      songName: snapshot['songName'],
      caption: snapshot['caption'],
      videoUrl: snapshot['videoUrl'],
      profilePhoto: snapshot['profilePhoto'],
    );



  }

}
