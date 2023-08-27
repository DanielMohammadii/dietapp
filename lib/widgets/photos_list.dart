import 'package:flutter/material.dart';

class SweetList extends StatefulWidget {
  const SweetList({
    super.key,
  });

  @override
  State<SweetList> createState() => _SweetListState();
}

class _SweetListState extends State<SweetList> {
  String transparentEmoji = 'assets/images/poo2.png';
  // final Stream<QuerySnapshot> _photoStream = FirebaseFirestore.instance
  //     .collection('photos')
  //     .orderBy('dateCreated')
  //     .snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: GestureDetector(
              onTap: () {
                dialog(context);
              },
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: const DecorationImage(
                      image: NetworkImage(''), fit: BoxFit.fill),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Future<dynamic> dialog(BuildContext context) {
    return showModalBottomSheet(
        elevation: 0,
        backgroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(15),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Emoji(urlPath: 'assets/images/poo1.png'),
                  Emoji(urlPath: 'assets/images/poo2.png'),
                  Emoji(urlPath: 'assets/images/poo3.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Emoji(urlPath: 'assets/images/poo4.png'),
                  Emoji(urlPath: 'assets/images/poo5.png'),
                  Emoji(urlPath: 'assets/images/poo6.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Emoji(urlPath: 'assets/images/poo7.png'),
                  Emoji(urlPath: 'assets/images/poo8.png'),
                  Emoji(urlPath: 'assets/images/poo4.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Emoji(urlPath: 'assets/images/poo3.png'),
                  Emoji(urlPath: 'assets/images/poo6.png'),
                  Emoji(urlPath: 'assets/images/poo2.png'),
                ],
              ),
            ],
          );
        });
  }
}

class Emoji extends StatefulWidget {
  final String urlPath;
  const Emoji({required this.urlPath, super.key});

  @override
  State<Emoji> createState() => _EmojiState();
}

class _EmojiState extends State<Emoji> {
  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: widget.urlPath,
      feedback: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.urlPath),
            fit: BoxFit.fill,
          ),
        ),
      ),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.urlPath),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
