import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SugarPhotoPage extends StatefulWidget {
  const SugarPhotoPage({
    super.key,
  });

  @override
  State<SugarPhotoPage> createState() => _SugarPhotoPageState();
}

class _SugarPhotoPageState extends State<SugarPhotoPage> {
  final collection = FirebaseFirestore.instance.collection('photos');
  late List<Map<String, dynamic>> listOFimages;

  List<PhotoModel> models = [];

  void getData() async {
    final data = await collection.get();
    setState(() {
      models = data.docs.map((e) => PhotoModel.fromFirestore(e)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SweetList(
        images: models,
      ),
    );
  }
}
