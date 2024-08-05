import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/models/feature_product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List icons = [
    Icons.emoji_food_beverage_outlined,
    Icons.fastfood_outlined,
    Icons.local_pizza_outlined,
    Icons.add,
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultHeightPadding),

            //men,woman,accessory,child selection row
            SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildGestureDetector(0),
                  buildGestureDetector(1),
                  buildGestureDetector(2),
                  buildGestureDetector(3),
                ],
              ),
            ),
            const SizedBox(height: defaultHeightPadding),
            Text("Most Ordered", style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: defaultHeightPadding),
            Text("Pure Veg", style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: defaultHeightPadding),
            Text("Non-veg", style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: defaultHeightPadding),
          ],
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(int currentIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = currentIndex;
        });
      },
      child: CircleAvatar(
        //enlarge the selected icon & highlight it with a different color.
        radius: currentIndex == selectedIndex ? 28 : 24,
        backgroundColor: currentIndex == selectedIndex ? Colors.brown : Colors.grey[200],
        child: Icon(
          icons[currentIndex],
          color: currentIndex == selectedIndex ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
