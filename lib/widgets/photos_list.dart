import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:switiban/models/photo_models.dart';

class SweetList extends StatefulWidget {
  final List<PhotoModel> images;
  const SweetList({
    super.key,
    required this.images,
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
        itemCount: widget.images.length,
        itemBuilder: ((context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: GestureDetector(
              onTap: () {
                dialog(context);
              },
              child: CachedNetworkImage(
                height: 400,
                imageUrl: widget.images[index].imgUrl,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                  color: Colors.white12,
                  child: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
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
