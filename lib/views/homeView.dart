import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_demo/view_model/home_view_model.dart';
import 'package:food_app_demo/widgets/food_view.dart';
import 'package:food_app_demo/widgets/image_card.dart';
import 'package:food_app_demo/views/components/search_bar.dart';

final _homeViewProvider = ChangeNotifierProvider((ref) => HomeViewModel());

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    final model = ref.read(_homeViewProvider);
    Future.delayed(const Duration(seconds: 2), () => model.getFood());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeViewModel model = ref.watch(_homeViewProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
            child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Find Best Recipe\nFor Cooking",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 40,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 15,
                                color: Colors.grey.withOpacity(0.3))
                          ]),
                      child: const SearchBar()),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: -5,
                                    blurRadius: 20,
                                    color: Colors.grey.withOpacity(0.3))
                              ]),
                          child: const Text(
                            "All",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: -5,
                                    blurRadius: 20,
                                    color: Colors.grey.withOpacity(0.3))
                              ]),
                          child: const Text(
                            "Sushi",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                          padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: -5,
                                    blurRadius: 20,
                                    color: Colors.grey.withOpacity(0.3))
                              ]),
                          child: const Text(
                            "Burger",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ...List.generate(
                    model.food.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodView(
                                    ingredientsList:
                                        model.food[index].ingredients,
                                    image: model.food[index].image,
                                    title: model.food[index].label,
                                    length: model.food[index].ingredients.length
                                        .toString(),
                                  )),
                        );
                      },
                      child: ImageCard(
                          title: model.food[index].label,
                          ingrideints:
                              model.food[index].ingredients.length.toString(),
                          image: model.food[index].image,
                          time: model.food[index].totalTime),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
