//
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_practice/item.dart';
//
// final itemProvider = StateNotifierProvider<ItemNotifier,List<Item>>((ref){
// return ItemNotifier();
// });
//
// class ItemNotifier extends StateNotifier<List<Item>>{
//   ItemNotifier(): super([]);
//   void addItem(String data){
//     final item = Item(name: data, id: DateTime.now().millisecondsSinceEpoch.toString());
//     state.add(item);
//     state = state.toList();
//   }
//   void deleteItem(String id){
//     state.removeWhere((item)=>item.id== id);
//     state = state.toList();
//   }
//   void updateItem(String id , String name){
//     final foundIndex = state.indexWhere((item)=> item.id == id );
//     state[foundIndex].name = name;
//     state.toList();
//   }
//
// }
//
