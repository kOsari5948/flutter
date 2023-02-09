import 'package:cloud_firestore/cloud_firestore.dart';

class Content {
  bool? Movie; //? Null 허용
  int? content;
  int? rank;
  int? view;
  DocumentReference? reference;

  //생성자
  Content({
    this.Movie,
    this.content,
    this.rank,
    this.view,
    this.reference,
  });

  //메소드
  Content.fromJson(dynamic json, this.reference) {
    //json 파싱하기
    Movie = json['Movie'];
    content = json['content'];
    rank = json['rank'];
    view = json['view'];
  }

  Content.fromSnapShot(DocumentSnapshot snapshot) //원래 쿼리 였는데 바뀜
      : this.fromJson(snapshot.data(), snapshot.reference);
  //도큐먼트 스냅샷 받아오기

  Content.fromQuerySnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data(), snapshot.reference);
  //쿼리 스냅샷 받아오기

  //메소드
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Movie'] = Movie;
    map['content'] = content;
    map['rank'] = rank;
    map['view'] = view;
    return map; //json
  } //json으로 만들어서 던지기
}

Future<List<Content>> getContent() async {
  //접속한 firebase 모델명
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection("Content");

  //실제 내용 가져 오기
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.get();

  //리스트 세로 만들기
  List<Content> content = [];
  for (var doc in querySnapshot.docs) {
    Content movieee = Content.fromQuerySnapshot(doc);
    content.add(movieee);
  }
  return content;
}

/*Scaffold(
              body: FutureBuilder(
                future: content,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("tlqkf");
                  } else {
                    print("saga");
                    print(snapshot.data!.toList()[0].content);
                    print(snapshot.data!.toList()[0].Movie);

                    CollectionReference<Map<String, dynamic>> collectionReference;
                    
                    if(snapshot.data!.toList()[0].Movie!){
                      collectionReference= FirebaseFirestore.instance.collection("Movie");
                    }else{
                      collectionReference= FirebaseFirestore.instance.collection("Series");
                    }
                     collectionReference.get().then((value) {
                       print(value.docs[snapshot.data!.toList()[0].content!-1].data());
                     },);
                    return Text("성공");
                  }
                },
              ),
            )
          ],*/