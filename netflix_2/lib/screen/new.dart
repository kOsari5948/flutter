import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_2/screen/pro.dart';
import 'package:netflix_2/screen/save_setting.dart';
import 'package:netflix_2/screen/search_screen.dart';
import 'package:netflix_2/widget/bottom_bar.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:sticky_infinite_list/sticky_infinite_list.dart';

ScrollController _scrollController = ScrollController(initialScrollOffset: 0);

class New extends StatefulWidget {
  @override
  State<New> createState() => _new(); //상태 줘서 내부 만들기
}

class _new extends State<New> {
  int flag = 1; // 누가 선택된 상태인지 확인
  Color color1 = Colors.white; //버튼1 색상
  Color color1_text = Colors.black; //버튼1 폰트 색
  Color color2 = Colors.black; //버튼2 폰트 색
  Color color2_text = Colors.white; //버튼2 폰트 색
  Color color3 = Colors.black; //버튼3 폰트 색
  Color color3_text = Colors.white; //버튼3 폰트 색
  Color color4 = Colors.black; //버튼4 폰트 색
  Color color4_text = Colors.white; //버튼4 폰트 색
  double jump = 0;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

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
                onPressed: () => {
                  Navigator.of(context).push(MaterialPageRoute<Null>(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        return pro();
                      }))
                },
              ),
            ],
            toolbarHeight: 70,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(30),
                child: SingleChildScrollView(
                  controller: _scrollController,
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
                              jump = 0;
                              _scrollController.animateTo(
                                  duration: Duration(microseconds: 300000),
                                  curve: Curves.ease,
                                  jump);
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
                              jump = (deviceWidth / 2) - 200;
                              _scrollController.animateTo(
                                  duration: Duration(microseconds: 300000),
                                  curve: Curves.ease,
                                  jump);
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
                              jump = deviceWidth / 2;
                              _scrollController.animateTo(
                                  duration: Duration(microseconds: 300000),
                                  curve: Curves.ease,
                                  jump);
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
                              jump = deviceWidth;
                              _scrollController.animateTo(
                                  duration: Duration(microseconds: 300000),
                                  curve: Curves.ease,
                                  jump);
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
          body: ListView(children: <Widget>[
            //공개 예정
            Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                width: 400,
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "src/image/popcorn.png",
                          height: 20,
                          width: 20,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "  공개 예정",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 70,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "1월",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text(
                        "20",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 300,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 300, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 300,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 300,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 300,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 70,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "1월",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text(
                        "20",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 300,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 300, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 300,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 300,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 300,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 70,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "1월",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text(
                        "20",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 300,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 300, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 300,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 300,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 300,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 70,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "1월",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      Text(
                        "20",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 300,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 300, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 300,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 300,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 300,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            //모두의 인기 콘텐츠
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 15),
                      width: 400,
                      child: Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.asset(
                                "src/image/fire.png",
                                height: 20,
                                width: 20,
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "모두의 인기 콘텐츠",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      )),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset("src/image/solo2.png",
                          height: 150,
                          width: 400,
                          fit: BoxFit.fitWidth)) //나중에 DB에서 훔쳐 오기)
                  ,
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 400,
                      child: Text(
                        "자백",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                      width: 400,
                      child: Text(
                        "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                        style: TextStyle(color: Colors.grey),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      width: 400,
                      child: Text(
                        "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset("src/image/solo2.png",
                          height: 150,
                          width: 400,
                          fit: BoxFit.fitWidth)) //나중에 DB에서 훔쳐 오기)
                  ,
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 400,
                      child: Text(
                        "자백",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                      width: 400,
                      child: Text(
                        "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                        style: TextStyle(color: Colors.grey),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      width: 400,
                      child: Text(
                        "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset("src/image/solo2.png",
                          height: 150,
                          width: 400,
                          fit: BoxFit.fitWidth)) //나중에 DB에서 훔쳐 오기)
                  ,
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 400,
                      child: Text(
                        "자백",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                      width: 400,
                      child: Text(
                        "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                        style: TextStyle(color: Colors.grey),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      width: 400,
                      child: Text(
                        "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset("src/image/solo2.png",
                          height: 150,
                          width: 400,
                          fit: BoxFit.fitWidth)) //나중에 DB에서 훔쳐 오기)
                  ,
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 400,
                      child: Text(
                        "자백",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                      width: 400,
                      child: Text(
                        "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                        style: TextStyle(color: Colors.grey),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      width: 400,
                      child: Text(
                        "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset("src/image/solo2.png",
                          height: 150,
                          width: 400,
                          fit: BoxFit.fitWidth)) //나중에 DB에서 훔쳐 오기)
                  ,
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                            Image.asset("src/image/fire.png",
                                height: 40, width: 40),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 400,
                      child: Text(
                        "자백",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                      width: 400,
                      child: Text(
                        "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                        style: TextStyle(color: Colors.grey),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      width: 400,
                      child: Text(
                        "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )),
                ],
              ),
            ),
            //TOP 10 시리즈
            Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                width: 400,
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "src/image/top-10.png",
                          height: 20,
                          width: 20,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "  TOP 10 시리즈",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "1",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "2",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "3",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "4",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "5",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "6",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "7",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "8",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "9",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 9.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "10",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            //TOP 10 영화
            Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                width: 400,
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          "src/image/top-10.png",
                          height: 20,
                          width: 20,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "  TOP 10 영화",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "1",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "2",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "3",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "4",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "5",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "6",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "7",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "8",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "9",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
            StickyHeader(
                overlapHeaders: true,
                header: Container(
                  height: 58.0,
                  width: 60,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 9.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "10",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                content: Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Image.asset("src/image/solo2.png",
                          height: 200,
                          width: 350,
                          fit: BoxFit.fitWidth) //나중에 DB에서 훔쳐 오기
                      ,
                      SizedBox(
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                                Image.asset("src/image/fire.png",
                                    height: 40, width: 40),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 350, child: Text("2월 7일 공개")),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "자백",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                          width: 350,
                          child: Text(
                            "스마트폰을 분실한 여자와 그것을 주운 위험한 남자. 남자는 여자의 일거수일투족을 감시하며 그녀의 삶을 흔들어 놓는다.",
                            style: TextStyle(color: Colors.grey),
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: 350,
                          child: Text(
                            "긴장감 넘치는 • 미스터리 • 심리 게임 • 한국 작품 • 도서 원작 • 범죄",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ],
                  ),
                )),
          ])),
    );
  }
}
