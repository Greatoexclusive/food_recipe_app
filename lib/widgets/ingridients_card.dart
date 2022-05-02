import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class IngridientsCard extends StatelessWidget {
  const IngridientsCard({
    Key? key,
    required this.title,
    required this.ingrideints,
    required this.image,
  }) : super(key: key);
  final String title;
  final String ingrideints;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 100,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Text(title.toUpperCase(),
                  style: const TextStyle(
                    // overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  )),
            ),
            const Spacer(),
            Expanded(
              // flex: 2,
              child: Text(ingrideints,
                  style: TextStyle(
                    // overflow: TextOverflow.ellipsis,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  )),
            ),
          ],
        ));
  }
}
