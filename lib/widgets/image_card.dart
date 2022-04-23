import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:food_app_demo/widgets/food_view.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.title,
    required this.ingrideints,
    required this.image,
    required this.time,
  }) : super(key: key);
  final String title;
  final String ingrideints;
  final String image;
  final double time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              // padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 500,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
                child: Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(30)),
            )),
            Positioned(
                top: 30,
                right: 20,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.brown.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                    ))),
            Positioned(
              bottom: 30,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(ingrideints,
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          )),
                      Text(" Ingridients | ",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          )),
                      Text(time.toString(),
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          )),
                      Text(" Min",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
