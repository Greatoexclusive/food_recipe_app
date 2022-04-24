import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:food_app_demo/core/utils/colors.dart';
import 'package:food_app_demo/widgets/skeleton.dart';
import 'package:shimmer/shimmer.dart';

class ImageCardSkeleton extends StatelessWidget {
  const ImageCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: const Skeleton()),
              ),
              Positioned(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30)),
              )),
              Positioned(
                  top: 30,
                  right: 20,
                  child: Skeleton(
                    width: 45,
                    height: 45,
                  )),
              Positioned(
                bottom: 30,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeleton(
                      height: 30,
                      width: 250,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Skeleton(
                          width: 100,
                          height: 15,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Skeleton(
                          width: 50,
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          baseColor: Colors.grey.shade400,
          highlightColor: kSkelenton,
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
