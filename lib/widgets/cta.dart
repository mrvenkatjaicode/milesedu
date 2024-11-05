import 'package:flutter/material.dart';

class Cta extends StatelessWidget {
  final String? ctaImageUrl;
  const Cta({super.key, this.ctaImageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      ctaImageUrl ?? "",
      fit: BoxFit.fitHeight,
    );
  }
}
