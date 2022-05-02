import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_demo/view_model/home_view_model.dart';
import 'package:food_app_demo/views/components/image_card_skeleton.dart';
import 'package:food_app_demo/widgets/food_view.dart';
import 'package:food_app_demo/widgets/image_card.dart';
import 'package:google_fonts/google_fonts.dart';

final _homeViewProvider = ChangeNotifierProvider((ref) => HomeViewModel());
List<String> item = [
  "all",
  "sushi",
  "burger",
];
bool selected = false;
int? selectedIndex = 0;
ScrollController scrollController = ScrollController();

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    final model = ref.read(_homeViewProvider);
    Future.delayed(const Duration(seconds: 2), () => model.getItem());

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 2000) {
        // model.getFood(search, from, to);
        if (!ref.read(_homeViewProvider).isBusy) {
          model.getMore();
          print("i want more");
        }
      }
    });
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
          controller: scrollController,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Find Best Recipe\nFor Cooking",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                    ),
                  ),
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
                      ],
                    ),
                    child: TextField(
                      onSubmitted: ((value) {
                        model.food = [];
                        selectedIndex = value == "" ? 0 : null;
                        model.getItem();
                      }),
                      controller: model.myController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Destination",
                        hintStyle: GoogleFonts.sarabun(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(
                        item.length,
                        (index) => InkWell(
                          onTap: () {
                            model.food = [];
                            model.getItemForHelper(item[index]);
                            selectedIndex = index;
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(35, 15, 35, 15),
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? Colors.green
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: -5,
                                    blurRadius: 20,
                                    color: Colors.grey.withOpacity(0.3))
                              ],
                            ),
                            child: Text(
                              item[index].toUpperCase(),
                              style: TextStyle(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ...List.generate(
                    model.food.isEmpty ? 5 : model.food.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => model.food.isEmpty
                                  ? const Scaffold()
                                  : FoodView(
                                      ingredientsList:
                                          model.food[index].ingredients,
                                      image: model.food[index].image,
                                      title: model.food[index].label,
                                      length: model
                                          .food[index].ingredients.length
                                          .toString(),
                                    )),
                        );
                      },
                      child: model.food.isEmpty
                          ? const ImageCardSkeleton()
                          : ImageCard(
                              title: model.food[index].label,
                              ingrideints: model.food[index].ingredients.length
                                  .toString(),
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
