import 'package:flutter/material.dart';

class MasterClass extends StatelessWidget {
  final String? masterClassImageUrl;
  const MasterClass({super.key, this.masterClassImageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(masterClassImageUrl ?? "");
  }
}
