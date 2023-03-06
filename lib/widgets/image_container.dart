import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imgUrl;
  final double sizeH;
  final double sizeW;

  const ImageContainer(
      {super.key,
      required this.imgUrl,
      required this.sizeH,
      required this.sizeW});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeH,
      width: sizeW,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imgUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
