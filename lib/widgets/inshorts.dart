import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Inshorts extends StatelessWidget {
  final String? inshortsImageUrl;
  final String? inshortsTitle;
  const Inshorts({super.key, this.inshortsImageUrl, this.inshortsTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  inshortsImageUrl ?? "",
                  height: MediaQuery.of(context).size.height / 3.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      "assets/logo.svg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        inshortsTitle ?? "",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
