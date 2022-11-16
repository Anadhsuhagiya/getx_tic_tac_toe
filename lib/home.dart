import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tic_tac_toe/new_game.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tic Tac Toe"),
        backgroundColor: Color(0xff010d4d),
      ),

      body: Column(
        children: [
          InkWell(
            onTap: () {
              Get.off(new_game());
            },
            child: Container(
              height: 60,
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 40),
              decoration: ShapeDecoration(
                  color: Color(0xff000742),
                  shadows: [
                    BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                        color: Colors.black.withOpacity(0.4))
                  ],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text("New Game",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
          ),

          Container(
            height: 60,
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            decoration: ShapeDecoration(
                color: Color(0xff000742),
                shadows: [
                  BoxShadow(
                      blurRadius: 7,
                      spreadRadius: 1,
                      offset: Offset(0, 3),
                      color: Colors.black.withOpacity(0.4))
                ],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Text("Settings",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
          ),

          Container(
            height: 60,
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            decoration: ShapeDecoration(
                color: Color(0xff000742),
                shadows: [
                  BoxShadow(
                      blurRadius: 7,
                      spreadRadius: 1,
                      offset: Offset(0, 3),
                      color: Colors.black.withOpacity(0.4))
                ],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Text("Rate Us",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
          ),
        ],
      ),
    );
  }
}
