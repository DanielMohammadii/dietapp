import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:switiban/models/photo_models.dart';
import 'package:switiban/widgets/widgets.dart';
import 'package:switiban/shared_prefences/date_picked.dart';

class SugarPhotoPage extends StatefulWidget {
  const SugarPhotoPage({
    super.key,
  });

  @override
  State<SugarPhotoPage> createState() => _SugarPhotoPageState();
}

class _SugarPhotoPageState extends State<SugarPhotoPage> {
  void getData() async {
    final ref = FirebaseFirestore.instance.collection('photos').doc()
      ..withConverter(
        fromFirestore: PhotoModel.fromFirestore,
        toFirestore: ((PhotoModel photoModel, options) =>
            photoModel.toFirestore()),
      );

    final docSnap = await ref.get();
    final photos = docSnap.data();
    if (photos != null) {
      print(photos);
    } else {
      print("No such document.");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          // SweetList(),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Text(
              'sdf',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
