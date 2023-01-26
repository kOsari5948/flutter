import 'package:flutter/material.dart';
import 'package:netflix_2/main.dart';

int flag = 0;

class Bottom extends StatelessWidget {
  //하단바 설정
  @override
  Widget build(BuildContext context) {
    return Container(
      //컨테이너를 리턴
      color: Colors.black, //바탕색 블랙
      child: Container(
        height: 50,
        child: TabBar(
          //여기서 탭바 설정
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent, //투명
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.home_filled,
                size: 30,
              ),
              child: Text(
                '홈',
                style: TextStyle(fontSize: 9, height: -0.2),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.add_to_photos_rounded,
                size: 30,
              ),
              child: Text(
                'New&Hot',
                style: TextStyle(fontSize: 9, height: -0.2),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.download_for_offline_rounded,
                size: 30,
              ),
              child: Text(
                '저장한 콘텐츠',
                style: TextStyle(fontSize: 9, height: -0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
