import 'package:flutter/material.dart';

class Reels extends StatelessWidget {
  final String? reelsImageUrl;
  const Reels({super.key, this.reelsImageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      reelsImageUrl ?? "",
      fit: BoxFit.fitHeight,
    );
  }
}
