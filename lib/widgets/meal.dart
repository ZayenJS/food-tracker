import 'package:flutter/material.dart';
import 'package:food_tracker/utils/page.dart';
import 'package:food_tracker/widgets/journal/add_food.dart';

class Food {
  final String name;
  final String brand;
  final double quantity;
  final int kcal;

  const Food({
    required this.name,
    required this.brand,
    required this.quantity,
    required this.kcal,
  });
}

class Meal extends StatelessWidget {
  final String title;
  final List<Food> foods;

  const Meal({
    super.key,
    required this.title,
    required this.foods,
  });

  @override
  Widget build(BuildContext context) {
    final int totalKcal = 0;

    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            trailing: Text(
              totalKcal.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
          const Divider(),
          ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: foods.length,
            itemBuilder: (context, index) {
              final Food food = foods[index];
              return ListTile(
                visualDensity: VisualDensity.compact,
                dense: true,
                title: Text(food.name),
                subtitle:
                    Text(food.brand + " - " + food.quantity.toString() + "g"),
                trailing: Text(food.kcal.toString()),
              );
            },
          ),
          const Divider(),
          ListTile(
            dense: true,
            visualDensity: VisualDensity.compact,
            leading: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {
                PageUtil.transition(context, JournalAddFoodScreen(meal: title));
              },
              child: const Text(
                "Ajouter un aliment",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
            trailing: IconButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {},
              icon: const Icon(Icons.more_horiz),
            ),
          )
        ],
      ),
    );
  }
}
