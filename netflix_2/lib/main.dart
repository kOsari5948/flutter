import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflix_2/screen/home.dart';
import 'package:netflix_2/screen/new.dart';
import 'package:netflix_2/screen/pro.dart';
import 'package:netflix_2/screen/save.dart';
import 'package:netflix_2/widget/bottom_bar.dart';

double linesize = 1;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //풀루터 초기화 (firebase)

  await Firebase.initializeApp(
      //befult setting 세팅 수동으로 한거
      name: 'netfi', //프로젝트 이름
      options: const FirebaseOptions(
          //전부 firebase에서 나온거
          apiKey: 'AIzaSyBcLH2_CrauAjj9MQjmQGnrxkJTozDCgIk',
          appId: '1:462285490231:android:ccbd751481f5428acc57b2',
          messagingSenderId: '462285490231',
          projectId: 'netfi-408c1'));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState(); //상태 줘서 내부 만들기
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //위젯 시작
    return MaterialApp(
      //머테리얼(안드로이드 스타일)로 만들꺼야
      title: 'Bbongflix',
      debugShowCheckedModeBanner: false, //디버그 포장 없에기
      theme: ThemeData(
        //테마 설정
        brightness: Brightness.dark, //전체 색상
        primaryColor: Colors.black, //타이틀 색상
      ),
      home: DefaultTabController(
        //탭 컨트롤러
        length: 4, //4개 짜리 만든다.
        child: Scaffold(
          /*appBar: AppBar(
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
          ),*/
          //화면 그리기
          body: new TabBarView(
            //탭 뷰 하나 하나가 이거임
            physics: const NeverScrollableScrollPhysics(), //스크롤 막기
            children: <Widget>[
              //위젯 여러개 설정 화면 여러개 설정
              home(),
              New(),
              save(),
              pro()
            ],
          ),
          bottomNavigationBar: Bottom(), //하단바설정 bottom_bar.dart
        ),
      ),
    );
  }
}

class SaveStorage {
  void linesizeadd() {
    linesize = linesize + 0.5;
  }

  void linesizeremove() {
    linesize = linesize - 0.5;
  }

  double linesizeget() {
    return linesize;
  }
}
