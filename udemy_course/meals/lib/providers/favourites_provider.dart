import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal){
    
    final mealIsFave = state.contains(meal);
    
    if (mealIsFave){
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final faveMealsProvider = StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref){
  return FavouriteMealsNotifier();
});