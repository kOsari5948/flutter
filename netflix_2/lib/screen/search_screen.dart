import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:netflix_2/model/movie.dart';
import 'package:netflix_2/screen/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _SearchScreenState() {
    _filter.addListener(() {
      //_filter에 리스너 달아주고
      setState(() {
        _searchText = _filter.text; //상태 바뀌면 _searchText에 검색어 넣어줌
      });
    });
  }

  Future<List<Movie>> movies = getMovie();

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Movie').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return _buildList(context, snapshot.data!.docs);
        });
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<DocumentSnapshot> searchResults = [];
    List<Widget> wlist = [];
    for (DocumentSnapshot d in snapshot) {
      if (d.data().toString().contains(_searchText)) {
        //검색어 포함 찾기
        searchResults.add(d);
      }
    }

    return Expanded(
        child: ListView(padding: EdgeInsets.fromLTRB(3, 10, 3, 10), children: [
      Container(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
        child: Text(
          "최다 검색",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Column(
        children:
            searchResults.map((data) => _buildListItem(context, data)).toList(),
      )
    ]));
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final movie = Movie.fromSnapShot(data);
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            child: Row(
              children: <Widget>[
                Image.network(
                  movie.img!,
                  width: 160,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 100,
                  margin: EdgeInsets.all(5),
                  child: Text(movie.title!, maxLines: 8),
                )
              ],
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<Null>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) {
                    return DetailScreen(movie: movie); //여기에 상세화면을 띄워라 @@@
                  }));
            },
          ),
          Icon(
            Icons.play_circle_outline,
            size: 50,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, //디버그 포장 없에기

        theme: ThemeData(
          //테마 설정
          scaffoldBackgroundColor: Colors.black,
          backgroundColor: Colors.black,
          brightness: Brightness.dark, //전체 색상
          primaryColor: Colors.black, //타이틀 색상
        ),
        home: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10)),
              //검색창
              Container(
                color: Colors.black,
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Row(
                  children: <Widget>[
                    focusNode.hasFocus
                        ? Expanded(
                            child: TextButton(
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _filter.clear();
                                  _searchText = "";
                                  focusNode.unfocus();
                                });
                              },
                            ),
                          )
                        : Expanded(
                            flex: 0,
                            child: Container(),
                          ),
                    Expanded(
                      flex: 6,
                      child: TextField(
                        focusNode: focusNode,
                        style: TextStyle(fontSize: 15),
                        autofocus: true,
                        controller: _filter, //해당 검색창의 이름 id
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white12,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white60,
                            size: 20,
                          ),
                          suffixIcon: focusNode.hasFocus
                              ? IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _filter.clear();
                                      _searchText = "";
                                    });
                                  },
                                )
                              : Container(),
                          hintText: '검색',
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //검색된 요소
              _buildBody(context),
            ],
          ),
        ));
  }
}
