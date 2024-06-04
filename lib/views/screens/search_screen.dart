
import 'package:cattie/views/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/search_controller.dart';
import '../../models/user.dart';



class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});




 SearchUserController searchController = Get.put(SearchUserController());




  @override
  Widget build(BuildContext context) {

    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: (){

              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            title: TextFormField(
              decoration: InputDecoration(
                label: Text('search'),
                filled: false,
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              onFieldSubmitted: (value) => searchController.searchUser(value),

            ),
          ),
          body: searchController.searchedUsers.isEmpty ? Center(
            child: Text('search for users!',style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),),
          ): ListView.builder(
              itemCount: searchController.searchedUsers.length,
              itemBuilder: (context,index ){

                User user  = searchController.searchedUsers[index];
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProfileScreen(uid: user.uid)));

                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.profilePhoto),
                    ),
                    title: Text(user.name, style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,

                    ),),
                  ),

                );
              }),
        );
      }
    );

  }
}
