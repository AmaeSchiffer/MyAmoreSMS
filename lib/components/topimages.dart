import 'package:flutter/material.dart';

class TopImages extends StatelessWidget {
  final String images;
  final double right, top, left, bottom;
  const TopImages(
      {Key key,
      @required this.images,
      this.right,
      this.top,
      this.left,
      this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: Image.asset(
        images,
        fit: BoxFit.fill,
      ),
    );
  }
}
