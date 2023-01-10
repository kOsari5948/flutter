import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:netflix_2/screen/save_setting.dart';
import 'package:netflix_2/widget/bottom_bar.dart';

class save extends StatefulWidget {
  @override
  State<save> createState() => _save(); //상태 줘서 내부 만들기
}

class _save extends State<save> {
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
            "저장된 콘텐츠 목록",
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
              onPressed: () => {},
            ),
            new IconButton(
              icon: new Icon(Icons.usb_rounded),
              tooltip: 'profile',
              onPressed: () => {},
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(bottom: 30),
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.settings),
                        label: Text("스마트 저장"),
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white))),
              ],
            ),
            Column(children: <Widget>[
              Center(
                  child: Text(
                "'나만의 자동 저장' 기능",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              )),
              Container(
                padding: EdgeInsets.only(top: 10),
                width: 300,
                child: Text(
                  "취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. 디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: Image.asset("src/image/save.jpg"),
                height: 300,
                padding: EdgeInsets.only(bottom: 50),
              ),
              //아웃라인 버튼 테두리 있는 버튼
              //ElevatedButton 색있음
              Container(
                width: 280,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => save_setting()));
                  },
                  child: Text("설정하기"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 81, 104, 220),
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),

              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("저장 가능한 콘텐츠 살펴보기"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Colors.black,
                      textStyle: TextStyle(fontWeight: FontWeight.bold)),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
