import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:netflix_2/screen/save_setting.dart';
import 'package:netflix_2/widget/bottom_bar.dart';

class save_setting extends StatefulWidget {
  @override
  State<save_setting> createState() => _save_setting(); //상태 줘서 내부 만들기
}

class _save_setting extends State<save_setting> {
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
          actions: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.cancel,
                color: Color.fromARGB(255, 35, 35, 35),
                size: 35,
              ),
              tooltip: 'profile',
              onPressed: () => {Navigator.pop(context)},
            ),
          ],
          toolbarHeight: 70,
          flexibleSpace: new Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(20, 0, 0, 0),
                ],
                    stops: [
                  0,
                  1
                ])),
          ),
        ),
        //화면 그리기
        body: ListView(
          children: <Widget>[
            //icon 버튼은 사진만 들어감 text에다가 icon달아야함
            Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "시작해 볼까요?",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: EdgeInsets.only(top: 10),
                width: 300,
                child: Text(
                  "몇 GB의 영화의 시리즈를 저장하고 싶은지 선택하세요. '설정'> '스마트 저장' 메뉴에서 언제든지 변경할 수 있습니다.",
                  style: TextStyle(fontSize: 13.5, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Image.asset("src/image/save.jpg"),
                height: 250,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 15, right: 11),
                    child: IconButton(
                      icon: new Icon(
                        Icons.remove_circle,
                        color: Color.fromARGB(255, 155, 155, 155),
                        size: 45,
                      ),
                      tooltip: 'profile',
                      onPressed: () => {Navigator.pop(context)},
                    ),
                  ),
                  Container(
                    child: Text(
                      "1.0",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 15, right: 11),
                    child: IconButton(
                      icon: new Icon(
                        Icons.add_circle,
                        color: Color.fromARGB(255, 155, 155, 155),
                        size: 45,
                      ),
                      tooltip: 'profile',
                      onPressed: () => {Navigator.pop(context)},
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  "GB를 사용합니다.",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 0.5,
                width: 500,
                color: Colors.grey,
              ),
              //아웃라인 버튼 테두리 있는 버튼
              //ElevatedButton 색있음
              Container(
                width: 360,
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  "1GB는 일반 화질 기준으로 콘텐츠 약 4시간 분량에 해당합니다. 이 기능은 Wi-Fi에서만 작동합니다.",
                  style: TextStyle(fontSize: 13),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 360,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("켜기"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 81, 104, 220),
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),

              //프로그래습바 너어라

              Container(
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 10,
                          height: 10,
                          color: Colors.blue,

                        ),
                        Text('   나만의 자동 저장')
                        ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                      //코드부분           
                      Container(
                          width: 10,
                          height: 10,
                          color: Colors.white,
                        ),          
                      Text('   여유 공간')
                    ])
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
