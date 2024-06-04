import 'package:cattie/constants.dart';
import 'package:cattie/controllers/comment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as tago;


class CommentScreen extends StatelessWidget {

  final String Id;
  CommentScreen({super.key, required this.Id});


  static String id = 'CommentScreen';


  final TextEditingController commentTextController = TextEditingController();

  CommentController commentController = Get.put(CommentController());


  @override
  Widget build(BuildContext context) {

    commentController.updatePostId(Id);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () {
                    return ListView.builder(
                      itemCount: commentController.comments.length,
                        itemBuilder: (context,index){

                        final comment = commentController.comments[index];


                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: NetworkImage(comment.profilePhoto),
                            ),
                            title: Row(
                              children: [
                                Text(comment.comment,style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),)
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Text(tago.format(comment.datePublished.toDate()),style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,

                                ),
                                ),
                                const SizedBox(width: 10,),
                                Text('${comment.likes.length} likes', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,

                                ),),
                              ],
                            ),
                            trailing: InkWell(
                                 onTap: () => commentController.likeComment(comment.id),
                                child: Icon(
                                  Icons.favorite,
                                  color: comment.likes.contains(authService.user.uid) ?  Colors.red: Colors.white,
                                  size: 25,)),
                          );
                        }
                    );
                  }
                ),
              ),
              const Divider(),
              ListTile(
                title: TextFormField(
                  controller: commentTextController,
                  style: TextStyle(fontSize: 16,color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Comment',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    )
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    commentController.postComment(commentTextController.text);
                    commentTextController.clear();
                  } ,
                  child: Text('send',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
