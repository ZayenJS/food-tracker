import 'package:flutter/material.dart';
import 'package:food_tracker/widgets/meal.dart';

class FoodDay extends StatelessWidget {
  final dynamic data;

  const FoodDay({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Calories Restantes",
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text('2 000'),
                        Text('Objectif'),
                      ],
                    ),
                    Text("-"),
                    Column(
                      children: [
                        Text('1 748'),
                        Text('Aliments'),
                      ],
                    ),
                    Text("+"),
                    Column(
                      children: [
                        Text('0'),
                        Text('Exercices'),
                      ],
                    ),
                    Text("="),
                    Column(
                      children: [
                        Text('252'),
                        Text('Restants'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        const Meal(
          title: "Petit-déjeuner",
          foods: [
            Food(name: "Pain", brand: "Carrefour", quantity: 80, kcal: 170),
            Food(name: "Beurre", brand: "Carrefour", quantity: 10, kcal: 75),
            Food(name: "Confiture", brand: "Carrefour", quantity: 20, kcal: 50),
            Food(name: "Café", brand: "Carrefour", quantity: 200, kcal: 5),
          ],
        ),
        const SizedBox(height: 16.0),
        const Meal(
          title: "Déjeuner",
          foods: [
            Food(name: "Pâtes", brand: "Carrefour", quantity: 100, kcal: 350),
            Food(
                name: "Sauce tomate",
                brand: "Carrefour",
                quantity: 100,
                kcal: 50),
            Food(name: "Poulet", brand: "Carrefour", quantity: 100, kcal: 150),
            Food(name: "Yaourt", brand: "Carrefour", quantity: 125, kcal: 100),
          ],
        ),
        const SizedBox(height: 16.0),
        const Meal(
          title: "Dîner",
          foods: [
            Food(name: "Pâtes", brand: "Carrefour", quantity: 100, kcal: 350),
            Food(
                name: "Sauce tomate",
                brand: "Carrefour",
                quantity: 100,
                kcal: 50),
            Food(name: "Poulet", brand: "Carrefour", quantity: 100, kcal: 150),
            Food(name: "Yaourt", brand: "Carrefour", quantity: 125, kcal: 100),
          ],
        ),
        const SizedBox(height: 16.0),
        const Meal(
          title: "Collation",
          foods: [
            Food(name: "Pâtes", brand: "Carrefour", quantity: 100, kcal: 350),
            Food(
                name: "Sauce tomate",
                brand: "Carrefour",
                quantity: 100,
                kcal: 50),
            Food(name: "Poulet", brand: "Carrefour", quantity: 100, kcal: 150),
            Food(name: "Yaourt", brand: "Carrefour", quantity: 125, kcal: 100),
          ],
        ),
      ],
    );
  }
}
