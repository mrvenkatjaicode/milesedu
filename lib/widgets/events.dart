import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  final String? eventsImageUrl;
  const Events({super.key, this.eventsImageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      eventsImageUrl ?? "",
      fit: BoxFit.fill,
    );
  }
}
