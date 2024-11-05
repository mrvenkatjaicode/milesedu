import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  final String? bannerImageUrl;
  const Banners({super.key, this.bannerImageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      bannerImageUrl ?? "",
      fit: BoxFit.fitWidth,
    );
  }
}
