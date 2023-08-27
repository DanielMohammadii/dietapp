import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';

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

  void getData() async {
    late List<Map<String, dynamic>> templistOFimages = [];
    late List<int> listOFDate = [];
    late List<List<String>> listOfSameDateImage = [];
    var data = await collection.get();
    for (var element in data.docs) {
      templistOFimages.add(element.data());
    }

    for (var p in templistOFimages) {
      listOFDate.add(p['dateCreated']);
    }
    for (var d in listOFDate) {
      for (var p in templistOFimages) {
        if (p['dateCreated'] == d) {
          listOfSameDateImage.add(p['imgUrl']);
        }
      }
    }
    Logger.i(templistOFimages);
    Logger.i(listOFDate);
    Logger.i(listOfSameDateImage);
    setState(() {
      listOFimages = templistOFimages;
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
      body: Stack(
        children: [
          // SweetList(),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: const Text(
              'sdf',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
