// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
 

class PhotoModel {
  final String imgUrl;
  final DateTime dateCreated;
  PhotoModel({
    required this.imgUrl,
    required this.dateCreated,
  });

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      if (imgUrl != null) 'imgUrl': imgUrl,
      if (imgUrl != null) 'dateCreated': dateCreated.millisecondsSinceEpoch,
    };
  }

  factory PhotoModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return PhotoModel(
      imgUrl: data?['imgUrl'] as String,
      dateCreated:
          DateTime.fromMillisecondsSinceEpoch(data?['dateCreated'] as int),
    );
  }
}
