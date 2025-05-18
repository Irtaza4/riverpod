
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/favourite_state.dart';

final favouriteProvider = StateNotifierProvider<FavouriteNotifier,FavouriteStates>((ref){
  return FavouriteNotifier();
});

class FavouriteNotifier extends StateNotifier<FavouriteStates>{
  FavouriteNotifier(): super(FavouriteStates(allItems: [], filteredItems: [], search: ''));
}