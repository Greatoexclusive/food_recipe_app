import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app_demo/models/ingridients_model.dart';
import 'package:food_app_demo/widgets/ingridients_card.dart';

class FoodView extends StatelessWidget {
  const FoodView({
    Key? key,
    required this.image,
    required this.title,
    required this.length,
    required this.ingredientsList,
  }) : super(key: key);
  final String image;
  final String title;
  final String length;
  final List<IngridientsModel> ingredientsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: -5,
                                    blurRadius: 15,
                                    color: Colors.grey.withOpacity(0.3))
                              ]),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(title,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          )),
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: -5,
                                  blurRadius: 15,
                                  color: Colors.grey.withOpacity(0.3))
                            ]),
                        child: const Icon(
                          Icons.more_horiz,
                          color: Colors.grey,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: image,
                          )),
                    ),
                    Container(
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(40)),
                        child: Icon(
                          Icons.play_circle_filled_outlined,
                          size: 50,
                          color: Colors.brown.shade400,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Ingridients: ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                        )),
                    Text(length,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                        )),
                    const Spacer(),
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: -5,
                                  blurRadius: 20,
                                  color: Colors.grey.withOpacity(0.3))
                            ]),
                        child: Row(
                          children: [
                            const Text(
                              "1 Serving",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ...List<dynamic>.generate(
                    ingredientsList.length,
                    (counter) => IngridientsCard(
                          title: ingredientsList[counter].text,
                          ingrideints: ingredientsList[counter].food,
                          image: ingredientsList[counter].image,
                        )),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      // width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 65),
                      padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: -5,
                                blurRadius: 20,
                                color: Colors.grey.withOpacity(0.3))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            " Start Cook!",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          const Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                          )
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
