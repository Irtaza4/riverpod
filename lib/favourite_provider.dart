
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/favourite_state.dart';
import 'package:riverpod_practice/item.dart';

final favouriteProvider = StateNotifierProvider<FavouriteNotifier,FavouriteStates>((ref){
  return FavouriteNotifier();
});

class FavouriteNotifier extends StateNotifier<FavouriteStates>{
  FavouriteNotifier(): super(FavouriteStates(allItems: [], filteredItems: [], search: ''));

  void addItem(){
    List<Item> item = [
      Item(name: 'Mac', id: 1, favourite: false),
      Item(name: 'iphone', id: 2, favourite: false),
      Item(name: 'samsung', id: 3, favourite: true),
      Item(name: 'dell', id: 4, favourite: true),
      Item(name: 'hp', id: 5, favourite: true),
    ];
    state = state.copyWith(allItems: item.toList(),filteredItems: item.toList());
  }
  void filterList(String search){
  state = state.copyWith(filteredItems: _filteritems(state.allItems, search));
  }
  void favouriteList(String option){
  state = state.copyWith(filteredItems: _favouriteOption(state.allItems, option));
  }
  List<Item> _favouriteOption(List<Item> items, String option){
    if(option=='All'){
      return items;
    }
    return items.where((item)=>item.favourite==true).toList();
  }
  List<Item> _filteritems(List<Item> items, String search){
    if(search.isEmpty){
      return items;
    }
    return items.where((item)=>item.name.toLowerCase().contains(search.toLowerCase())).toList();
  }
}