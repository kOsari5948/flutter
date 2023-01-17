import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:netflix_2/screen/save_setting.dart';
import 'package:netflix_2/widget/bottom_bar.dart';
import 'package:netflix_2/widget/box_slider.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState(); //상태 줘서 내부 만들기
}

class _homeState extends State<home> {
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
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset('src/image/logo.png'),
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
            Stack(
              //겹치는 거래요
              //순서 중요
              children: <Widget>[
                Image.asset(
                  'src/image/solo2.png',
                  fit: BoxFit.fitWidth,
                  height: 400,
                  width: 500,
                ),
                TopBar(),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        ),
                        Text(
                          '내가 찜한 콘텐츠',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white, // Background Color
                      ),
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.all(3),
                          ),
                          Text(
                            '재생',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Column(children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          //   Navigator.of(context).push(MaterialPageRoute<Null>(
                          //       fullscreenDialog: true,
                          //       builder: (BuildContext context) {
                          //         return DetailScreen(
                          //           movie: movies[_currentPage],
                          //         );
                          //       }));
                        },
                      ),
                      Text(
                        '정보',
                        style: TextStyle(fontSize: 11),
                      )
                    ]),
                  )
                ],
              ),
            ),

            //위젯들 추가 한곳
            BoxSlider(movies: movies),
            //icon 버튼은 사진만 들어감 text에다가 icon달아야함
          ],
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  //탑바 설정
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7), //왼쪽 위 오른쪽 아래
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text(
              '시리즈',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 15),
              child: Row(children: <Widget>[
                Text(
                  '카테고리',
                  style: TextStyle(fontSize: 14),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: 25,
                )
              ])),
        ],
      ),
    );
  }
}
