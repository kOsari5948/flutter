import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:netflix_2/model/movie.dart';

class DetailScreen extends StatefulWidget {
  // stateful 위젯
  final Movie movie;
  DetailScreen({required this.movie});
  _DetailScreenState createState() => _DetailScreenState(); // 상태 줘서 내부 만들기
}

class _DetailScreenState extends State<DetailScreen> {
  // 화면 제작
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 화면 그리기
      body: Container(
        // 전체 바디
        child: SafeArea(
          // 잘린 부분 없이 전부 나오기
          child: ListView(
            // 리스트뷰
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    // 블러 설정 부분
                    width: double.maxFinite, // double은 형변환 maxFinite 1.7xxxx
                    decoration: BoxDecoration(
                      // 박스 꾸미기
                      image: DecorationImage(
                        // 이미지 넣기
                        image: NetworkImage(widget.movie.img!), // 이미지 리소스
                        fit: BoxFit.cover, // 이미지 전체 채우기
                      ),
                    ),
                    child: ClipRect(
                      // 자식 밖으로 튀어나가는거 방지
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 10, sigmaY: 10), // 블러 설정 x축 y축
                        child: Container(
                          // 블러 처리 포스터 부분
                          alignment: Alignment.center, // 중앙정렬
                          color: Colors.black.withOpacity(0.1), // 투명도
                          child: Container(
                            // 블러된 포스터 위에
                            child: Column(
                              children: <Widget>[
                                Container(
                                  // 안쪽 포스터
                                  padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                                  child: Image.network(widget.movie.img!),
                                  height: 300,
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        widget.movie.title!,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '98% 일치 ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.green),
                                      ),
                                      Text(
                                        '2019 ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        '15+ ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            backgroundColor: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text(
                                        '시즌 1개',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  padding: EdgeInsets.all(3),
                                  margin: EdgeInsets.all(3),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.play_arrow,
                                          color: Colors.black,
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
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black),
                                  padding: EdgeInsets.all(3),
                                  margin: EdgeInsets.all(3),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.download,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          '저장',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '1화',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ), // moive에 대한 정보 나열
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                          '그동안 약한 기술을 보여주고 싶었던 백호는 마침 방문한 상양고\n선수들에게 연습 시합을 제안한다. 하지만 갑자기 변덕규가 등장하는\n바람에 백호는 벤치 신세가 된다.',
                                          textAlign: TextAlign.left),
                                    ],
                                  ),
                                ), // moive에 대한 정보 나열
                                Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '출연: 쿠시오 타케시, 히라미츠 아키코, 아나다 키요유키, 야정찬, 야민철',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: AppBar(
                      automaticallyImplyLeading: false, // 왼쪽 뒤로가기 삭제
                      // 뒤로가기 기본 상단바
                      backgroundColor: Colors.transparent, // 투명함 00ffff
                      elevation: 0, // 그림자 0이면 없음
                      actions: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {},
                              icon: Icon(Icons.cast),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.cancel),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.black26, // 내가 찜한 컨텐츠 부분
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // 좌측 정렬
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10), // 좌 위 우 아래
                      child: InkWell(
                        // 제스처 설정
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.add),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Text(
                              '내가 찜한 콘텐츠',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white60,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.thumb_up),
                            Padding(
                              padding: EdgeInsets.all(5),
                            ),
                            Text(
                              '평가',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.white60),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.send),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            '공유',
                            style:
                                TextStyle(fontSize: 11, color: Colors.white60),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeMenuButton() {
  return Container();
}
