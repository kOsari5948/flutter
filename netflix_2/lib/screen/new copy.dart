import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_2/screen/save_setting.dart';
import 'package:netflix_2/screen/search_screen.dart';
import 'package:netflix_2/widget/bottom_bar.dart';

class New extends StatefulWidget {
  @override
  State<New> createState() => _new(); //상태 줘서 내부 만들기
}

class _new extends State<New> {
  int flag = 1; // 누가 선택된 상태인지 확인
  Color color1 = Colors.white; //버튼1 색상
  Color color1_text = Colors.black; //버튼1 폰트 색
  Color color2 = Colors.black; //버튼1 폰트 색
  Color color2_text = Colors.white; //버튼1 폰트 색
  Color color3 = Colors.black; //버튼1 폰트 색
  Color color3_text = Colors.white; //버튼1 폰트 색
  Color color4 = Colors.black; //버튼1 폰트 색
  Color color4_text = Colors.white; //버튼1 폰트 색
  @override
  Widget build(BuildContext context) {
    //위젯 시작
    return MaterialApp(
      //머테리얼(안드로이드 스타일)로 만들꺼야
      title: 'Bbongflix',
      debugShowCheckedModeBanner: false, //디버그 포장 없에기

      theme: ThemeData(
        //테마 설정
        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        brightness: Brightness.dark, //전체 색상
        primaryColor: Colors.black, //타이틀 색상
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              //title해야 text 넣을 수 있음 leading 쓰는건 아이콘에서 쓰자
              "NEW & HOT",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.cast),
                tooltip: 'cast',
                onPressed: () => {},
              ),
              new IconButton(
                icon: new Icon(Icons.search),
                tooltip: 'search',
                onPressed: () => {
                  Navigator.of(context).push(MaterialPageRoute<Null>(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        return SearchScreen();
                      }))
                },
              ),
              new IconButton(
                icon: new Icon(Icons.usb_rounded),
                tooltip: 'profile',
                onPressed: () => {},
              ),
            ],
            toolbarHeight: 70,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      height: 30,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: color1,
                            shape: RoundedRectangleBorder(
                                //모서리를 둥글게
                                borderRadius: BorderRadius.circular(20))),
                        label:
                            Text("공개예정", style: TextStyle(color: color1_text)),
                        icon: Image.asset("src/image/popcorn.png"),
                        onPressed: () {
                          setState(() {
                            if (flag != 1) {
                              color1 = Colors.white;
                              color1_text = Colors.black;
                              color2 = Colors.black;
                              color2_text = Colors.white;
                              color3 = Colors.black;
                              color3_text = Colors.white;
                              color4 = Colors.black;
                              color4_text = Colors.white;
                              flag = 1;
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      height: 30,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: color2,
                            shape: RoundedRectangleBorder(
                                //모서리를 둥글게
                                borderRadius: BorderRadius.circular(20))),
                        label: Text("모두의 인기 콘텐츠",
                            style: TextStyle(color: color2_text)),
                        icon: Image.asset("src/image/fire.png"),
                        onPressed: () {
                          setState(() {
                            if (flag != 2) {
                              color1 = Colors.black;
                              color1_text = Colors.white;
                              color2 = Colors.white;
                              color2_text = Colors.black;
                              color3 = Colors.black;
                              color3_text = Colors.white;
                              color4 = Colors.black;
                              color4_text = Colors.white;
                              flag = 2;
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      height: 30,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: color3,
                            shape: RoundedRectangleBorder(
                                //모서리를 둥글게
                                borderRadius: BorderRadius.circular(20))),
                        label: Text("TOP 10 시리즈",
                            style: TextStyle(color: color3_text)),
                        icon: Image.asset("src/image/top-10.png"),
                        onPressed: () {
                          setState(() {
                            if (flag != 3) {
                              color1 = Colors.black;
                              color1_text = Colors.white;
                              color2 = Colors.black;
                              color2_text = Colors.white;
                              color3 = Colors.white;
                              color3_text = Colors.black;
                              color4 = Colors.black;
                              color4_text = Colors.white;
                              flag = 3;
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      height: 30,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: color4,
                            shape: RoundedRectangleBorder(
                                //모서리를 둥글게
                                borderRadius: BorderRadius.circular(20))),
                        label: Text("TOP 10 영화",
                            style: TextStyle(color: color4_text)),
                        icon: Image.asset("src/image/top-10.png"),
                        onPressed: () {
                          setState(() {
                            if (flag != 4) {
                              color1 = Colors.black;
                              color1_text = Colors.white;
                              color2 = Colors.black;
                              color2_text = Colors.white;
                              color3 = Colors.black;
                              color3_text = Colors.white;
                              color4 = Colors.white;
                              color4_text = Colors.black;
                              flag = 4;
                            }
                          });
                        },
                      ),
                    ),
                  ]),
                )),
          ),
          //화면 그리기
          body: Container(
            child: Column(children: <Widget>[]),
          )),
    );
  }
}
