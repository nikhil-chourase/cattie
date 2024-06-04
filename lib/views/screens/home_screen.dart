
import 'package:cattie/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  static String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff9fb6bb),
        selectedItemColor: Colors.blue.shade700,
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndex,
        onTap: (idx){
          setState(() {
            pageIndex = idx;
          });

        },
        items: [
          BottomNavigationBarItem(
            icon: Icon( Icons.home,
              color: Colors.white,
              size: 30,),
            label: 'home',

          ),
          BottomNavigationBarItem(

            icon: Icon( Icons.search,
              color: Colors.white,
              size: 30,),
            label: 'search',

          ),BottomNavigationBarItem(
            icon: CustomIcon(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.message,
              color: Colors.white,
              size: 30,),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.person,
              color: Colors.white,
              size: 30,),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[pageIndex],
    );
  }
}
