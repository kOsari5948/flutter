import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:netflix_2/screen/save_setting.dart';
import 'package:netflix_2/screen/search_screen.dart';
import 'package:netflix_2/widget/bottom_bar.dart';

class pro extends StatefulWidget {
  @override
  State<pro> createState() => _pro(); //상태 줘서 내부 만들기
}

class _pro extends State<pro> {
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
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Chan",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          //화면 그리기
          body: new TabBarView(
            //탭 뷰 하나 하나가 이거임
            physics: const NeverScrollableScrollPhysics(), //스크롤 막기
            children: <Widget>[
              //위젯 여러개 설정 화면 여러개 설정
              ListView(
                children: <Widget>[
                  //icon 버튼은 사진만 들어감 text에다가 icon달아야함
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.account_box,
                                size: 60,
                              ),
                              Text("김민철")
                            ],
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.account_box,
                                size: 60,
                              ),
                              Text("김민철")
                            ],
                          )),
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.account_box,
                                size: 60,
                              ),
                              Text("김민철")
                            ],
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.park_outlined),
                      Text("  프로필 관리")
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Color(0xff121212),
                    child: Row(children: <Widget>[
                      Icon(Icons.check),
                      Text("내가 찜한 콘텐츠"),
                      Container(
                        padding: EdgeInsets.fromLTRB(240, 0, 0, 0),
                        child: Icon(Icons.arrow_forward_ios),
                      )
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Color(0xff121212),
                    child: Row(children: <Widget>[
                      Icon(Icons.check),
                      Text("내가 찜한 콘텐츠"),
                      Container(
                        padding: EdgeInsets.fromLTRB(240, 0, 0, 0),
                        child: Icon(Icons.arrow_forward_ios),
                      )
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Color(0xff121212),
                    child: Row(children: <Widget>[
                      Icon(Icons.check),
                      Text("내가 찜한 콘텐츠"),
                      Container(
                        padding: EdgeInsets.fromLTRB(240, 0, 0, 0),
                        child: Icon(Icons.arrow_forward_ios),
                      )
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    color: Color(0xff121212),
                    child: Row(children: <Widget>[
                      Icon(Icons.check),
                      Text("내가 찜한 콘텐츠"),
                      Container(
                        padding: EdgeInsets.fromLTRB(240, 0, 0, 0),
                        child: Icon(Icons.arrow_forward_ios),
                      )
                    ]),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text("로그아웃")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text("버전: 15.12.0(8)")],
                  )
                ],
              ),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
