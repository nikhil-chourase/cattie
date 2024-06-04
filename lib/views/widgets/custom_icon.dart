

import 'package:flutter/material.dart';


class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 30,
      child: Stack(
        children: [


          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4)
              ),
              child: Icon(Icons.add,color: Colors.grey,),
            ),
          ),
        ],
      ),
    );
  }
}
