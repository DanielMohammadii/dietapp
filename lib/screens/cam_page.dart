import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:switiban/models/photo_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart'; 
import 'package:firebase_core/firebase_core.dart';

class Cam extends StatefulWidget {
  const Cam({super.key});

  @override
  State<Cam> createState() => _CamState();
}

class _CamState extends State<Cam> {
  File? image;
  final db = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  Future cam(BuildContext context) async {
    final initalDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initalDate,
        firstDate: DateTime(DateTime.now().year + 0),
        lastDate: DateTime.now());
    if (newDate == null) {
      return;
    }

    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    final temImage = File(image.path);

    final fileName = basename(temImage.path);
    final destination = 'files/$fileName';
    try {
      UploadTask uploadTask = storageRef.ref(destination).putFile(temImage);
      String urlRef = await (await uploadTask).ref.getDownloadURL();

      final photo = PhotoModel(imgUrl: urlRef, dateCreated: newDate);
      final photoToDb = db.collection('photos').withConverter(
            fromFirestore: PhotoModel.fromFirestore,
            toFirestore: ((PhotoModel photoModel, options) =>
                photoModel.toFirestore()),
          );

      photoToDb.add(photo);
    } catch (e) {
      return ('errro');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          cam(context);
        },
        icon: Icon(
          Icons.camera,
          size: 40,
          color: Colors.red,
        ),
      ),
    );
  }
}
