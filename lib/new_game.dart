import 'package:flutter/material.dart';
import 'package:get/get.dart';

class new_game extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    b B = Get.put(b());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Game"),
          backgroundColor: Color(0xff010d4d),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                  height: 50,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Color(0xff010d4d),
                      shadows: [
                        BoxShadow(
                          color: Color(0xff010d4d),
                          blurStyle: BlurStyle.normal,
                          offset: Offset(2, 1),
                          blurRadius: 5
                        )
                      ],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text("Player 1", style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                  height: 50,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                      color: Color(0xff010d4d),
                      shadows: [
                        BoxShadow(
                            color: Color(0xff010d4d),
                            blurStyle: BlurStyle.normal,
                            offset: Offset(2, 1),
                            blurRadius: 5
                        )
                      ],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text("${B.cnt1.value} - ${B.cnt2.value}", style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                  height: 50,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                      color: Color(0xff010d4d),
                      shadows: [
                        BoxShadow(
                            color: Color(0xff010d4d),
                            blurStyle: BlurStyle.normal,
                            offset: Offset(2, 1),
                            blurRadius: 5
                        )
                      ],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text("Player 2", style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
              ],
            ),

            Container(
              alignment: Alignment.center,
              height: 80,
              width: double.infinity,
              decoration: ShapeDecoration(
                  shadows: [
                    BoxShadow(
                        color: Color(0xff010d4d),
                        blurStyle: BlurStyle.normal,
                        offset: Offset(2, 1),
                        blurRadius: 5
                    )
                  ],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: B.s1 == 0 ? Color(0xff010d4d) : (B.s1 == 1 ? Colors.red : Colors.cyan )),
              margin: EdgeInsets.all(30),
              child: Obx(() => Text(
                B.msg.value,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    B.box(0),
                    B.box(1),
                    B.box(2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    B.box(3),
                    B.box(4),
                    B.box(5),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    B.box(6),
                    B.box(7),
                    B.box(8),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.all(50),
                      decoration: ShapeDecoration(
                        shadows: [
                          BoxShadow(
                              color: Color(0xff010d4d),
                              blurStyle: BlurStyle.normal,
                              offset: Offset(2, 1),
                              blurRadius: 5
                          )
                        ],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xff010d4d))),
                        onPressed: () {
                          B.reset();
                        },icon: Icon(Icons.refresh_rounded),
                        label: Text("Reset",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2.0,fontSize: 16),),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        shadows: [
                          BoxShadow(
                              color: Color(0xff010d4d),
                              blurStyle: BlurStyle.normal,
                              offset: Offset(2, 1),
                              blurRadius: 5
                          )
                        ],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(0xff010d4d))),
                        onPressed: () {
                          B.newgame();
                        },icon: Icon(Icons.power_settings_new),
                        label: Text("New Game",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 2.0,fontSize: 16),),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



class b extends GetxController{

  RxList l = List.filled(9, "").obs;
  RxInt w = 0.obs;
  RxInt cnt = 0.obs;
  RxInt cnt1 = 0.obs;
  RxInt cnt2 = 0.obs;
  String p1 = "X";
  String p2 = "O";
  RxString msg = "Game is Running".obs;
  RxInt s1 = 0.obs;


  Widget box(int i)
  {
    return InkWell(
      onTap: () {
        if(l[i] == "" && w == 0)
        {
          if(cnt%2 == 0)
          {
            l[i] = p1;
          }
          else
          {
            l[i] = p2;
          }
          cnt.value++;
          win();
        }
      },
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
            color: Color(0xff010d4d),
            shadows: [
              BoxShadow(
                  color: Color(0xff010d4d),
                  blurStyle: BlurStyle.normal,
                  offset: Offset(2, 1),
                  blurRadius: 5
              )
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Obx(() => Text(
          l[i],
          style: TextStyle(
              fontSize: 75, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }

  win() {
    if ((l[0] == p1 && l[1] == p1 && l[2] == p1) ||
        (l[3] == p1 && l[4] == p1 && l[5] == p1) ||
        (l[6] == p1 && l[7] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[3] == p1 && l[6] == p1) ||
        (l[1] == p1 && l[4] == p1 && l[7] == p1) ||
        (l[2] == p1 && l[5] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[4] == p1 && l[8] == p1) ||
        (l[2] == p1 && l[4] == p1 && l[6] == p1)) {
      msg.value = "$p1 is Winner";
      cnt1.value++;
      s1.value = 1;
      w.value = 1;
    } else if ((l[0] == p2 && l[1] == p2 && l[2] == p2) ||
        (l[3] == p2 && l[4] == p2 && l[5] == p2) ||
        (l[6] == p2 && l[7] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[3] == p2 && l[6] == p2) ||
        (l[1] == p2 && l[4] == p2 && l[7] == p2) ||
        (l[2] == p2 && l[5] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[4] == p2 && l[8] == p2) ||
        (l[2] == p2 && l[4] == p2 && l[6] == p2)) {
      msg.value = "$p2 is Winner";
      cnt2.value++;
      s1.value = 2;
      w = 1.obs;
    } else if (cnt == 9) {
      msg.value = "Game is Draw";
    }
  }

  void reset() {
    l.value = List.filled(9, "");
    cnt.value = 0;
    msg.value = "Game is Running";
    w.value = 0;
    s1.value = 0;
  }

  void newgame() {
    l.value = List.filled(9, "");
    cnt.value = 0;
    msg.value = "Game is Running";
    w.value = 0;
    s1.value = 0;
    cnt1.value = 0;
    cnt2.value = 0;
  }
}
