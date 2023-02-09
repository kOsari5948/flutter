import 'package:cloud_firestore/cloud_firestore.dart';

class Series {
  String? title; //? Null 허용
  String? img;
  DocumentReference? reference;

  //생성자
  Series({
    this.title,
    this.img,
    this.reference,
  });

  //메소드
  Series.fromJson(dynamic json, this.reference) {
    //json 파싱하기
    title = json['title'];
    img = json['img'];
  }

  Series.fromSnapShot(DocumentSnapshot snapshot) //원래 쿼리 였는데 바뀜
      : this.fromJson(snapshot.data(), snapshot.reference);
  //도큐먼트 스냅샷 받아오기

  Series.fromQuerySnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : this.fromJson(snapshot.data(), snapshot.reference);
  //쿼리 스냅샷 받아오기

  //메소드
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['img'] = img;
    return map; //json
  } //json으로 만들어서 던지기
}

Future<List<Series>> getFireModels() async {
  //접속한 firebase 모델명
  CollectionReference<Map<String, dynamic>> collectionReference =
      FirebaseFirestore.instance.collection("Series");

  //실제 내용 가져 오기
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await collectionReference.get();

  //리스트 세로 만들기
  List<Series> series = [];
  for (var doc in querySnapshot.docs) {
    Series movieee = Series.fromQuerySnapshot(doc);
    series.add(movieee);
  }
  return series;
}