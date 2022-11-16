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
                  margin: EdgeInsets.only(top: 10,bottom: 80,left: 10,right: 10),
                  height: 40,
                  width: 120,
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
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 80,left: 10,right: 10),
                  height: 40,
                  width: 70,
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
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 80,left: 10,right: 10),
                  height: 40,
                  width: 120,
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
                ),
              ],
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
  RxInt cnt = 0.obs, cnt1 = 0.obs , cnt2 = 0.obs;
  String p1 = "X";
  String p2 = "O";
  RxString msg = "Game is Running".obs;
  int s1 = 0;


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
          cnt++;
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
      msg = "$p1 is Winner".obs;
      cnt1++;
      s1 = 1;
      w = 1.obs;
    } else if ((l[0] == p2 && l[1] == p2 && l[2] == p2) ||
        (l[3] == p2 && l[4] == p2 && l[5] == p2) ||
        (l[6] == p2 && l[7] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[3] == p2 && l[6] == p2) ||
        (l[1] == p2 && l[4] == p2 && l[7] == p2) ||
        (l[2] == p2 && l[5] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[4] == p2 && l[8] == p2) ||
        (l[2] == p2 && l[4] == p2 && l[6] == p2)) {
      msg = "$p2 is Winner".obs;
      cnt2++;
      s1 = 2;
      w = 1.obs;
    } else if (cnt == 9) {
      msg = "Game is Draw".obs;
    }
  }
}
