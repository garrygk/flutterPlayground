import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favourites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal,});

  // final String title;

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final favouriteMeals = ref.watch(faveMealsProvider);
    final isFave = favouriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: (){
              final wasAdded = ref.read(faveMealsProvider.notifier).toggleMealFavouriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(wasAdded ? "Added to favourites." : "Removed from favourites."),
                )
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation){
                return RotationTransition(
                  turns: Tween(begin: 0.9, end: 1.0).animate(animation),
                  child: child,
                );
              },
              child: Icon(isFave ? Icons.star : Icons.star_border, key: ValueKey(isFave),)),
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14,),
            Text("Ingredients",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 14,),
            for (final ingredient in meal.ingredients)
              Text(ingredient,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              const SizedBox(height: 14,),
              Text("Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold
              ),),
            const SizedBox(height: 10,),
            for (final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Text(steps, textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground
                  ),
                ),
              ),
              const SizedBox(height: 14,),
          ],
        ),
      )
    );
  }
}