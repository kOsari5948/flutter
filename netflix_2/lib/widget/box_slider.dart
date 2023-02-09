import 'package:flutter/material.dart';
import 'package:netflix_2/model/movie.dart';
import 'package:netflix_2/screen/detail_screen.dart';

// 이미지니깐 stateless widget 입니다.
class BoxSlider extends StatelessWidget {
  final List<Movie> movies; //무비리스트 만들기
  String? title;

  BoxSlider({required this.movies, required this.title}); //매개변수
  @override
  Widget build(BuildContext context) {
    //위젯 만들기
    return Container(
      padding: EdgeInsets.all(7), //전체 태두리에 패딩 7 주기
      child: Column(
        //열로추가 (위 아래)
        crossAxisAlignment: CrossAxisAlignment.start, //좌측 부터
        children: <Widget>[
          //자식들 넣는다
          Text(
            title!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            //레이아웃 같은거
            height: 180, //높이
            child: ListView(
              // 그것의 자식은
              scrollDirection: Axis.horizontal, //스크롤을 수평으로
              children: makeBoxImages(context, movies), // 그것의 이미지 박기
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeBoxImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(InkWell(
      //컨테이너에 제스처 기능(이벤트) 추가
      onTap: () {
        //동작 제스처(이벤트) 감지
        Navigator.of(context).push(MaterialPageRoute<Null>(
            //화면 전환 위젯 Navigator push 이동 pop 돌아오기of 없어도 됨
            fullscreenDialog: true, //전체 화면
            builder: (BuildContext context) {
              //내부 화면 만들기
              return DetailScreen(
                //무비에 대한 movies 값만 받아서 이동
                movie: movies[i],
              );
            }));
      }, //이벤트
      child: Container(
        //이벤트
        padding: EdgeInsets.only(right: 10), //테두리 설정
        child: Align(
          //위젯 원하는 위치에 박을 수 있데 직접
          alignment: Alignment.centerLeft, //이걸로 직접 박기 중앙에 왼쪽에 박기
          child: Image.network(movies[i].img!), //리소스 파일 사용
        ),
      ),
    ));
  }
  return results;
}
