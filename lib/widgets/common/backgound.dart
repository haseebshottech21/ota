import 'package:flutter/material.dart';

class BackgoundImage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  const BackgoundImage({
    Key? key,
    required this.imagePath,
    this.fit = BoxFit.fill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: fit,
        ),
      ),
    );
  }
}
