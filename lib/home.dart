import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/stream_provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    print('build');
    return  Scaffold(
      appBar: AppBar(
        title: Text('Stream Builder',style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
      ),
      body: Consumer(builder: (context,ref,child){
        final provider =ref.watch(stockProvider);
        return Center(
          child: provider.when(
              data: (value)=>Text(value.toStringAsFixed(2),style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold
              ),),
              error: (error,stack)=>Text('Error : $error'),
              loading: ()=> CircularProgressIndicator()),
        );
      }),
    );
  }
}

















// class Home extends ConsumerWidget {
//   const Home({super.key});
//
//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//     final provider = ref.watch(fPro);
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text('Future Builder',style: TextStyle(
//           fontWeight: FontWeight.bold
//         ),),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: provider.when(
//             data: (value)=>ListView.builder(
//                 itemCount: value.length,
//                 itemBuilder: (context,index){
//                   return ListTile(
//                     title: Text(value[index].toString()),
//                   );
//             }),
//             error: (error,stack)=> Text('error: $error'),
//             loading: ()=> CircularProgressIndicator()),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:riverpod_practice/favourite_provider.dart';
// //
// // class Home extends ConsumerWidget {
// //   const Home({super.key});
// //
// //   @override
// //   Widget build(BuildContext context,WidgetRef ref) {
// //     final favPro= ref.watch(favouriteProvider);
// //     return  Scaffold(
// //       appBar: AppBar(
// //         title: Text('Favourite App',style: TextStyle(
// //           fontWeight: FontWeight.bold,
// //           fontSize: 25
// //         ),),
// //         centerTitle: true,
// //         actions: [
// //           PopupMenuButton(
// //               onSelected: (value){
// //                 ref.read(favouriteProvider.notifier).favouriteList(value);
// //               },
// //               itemBuilder: (BuildContext context){
// //             return const [
// //
// //               PopupMenuItem(
// //                   value: 'All',
// //                   child: Text('All')),
// //               PopupMenuItem(
// //                   value: 'Favourite',
// //                   child: Text('Favourite')),
// //             ];
// //           })
// //         ],
// //       ),
// //       floatingActionButton: FloatingActionButton(onPressed: (){
// //         ref.read(favouriteProvider.notifier).addItem();
// //       },child: Icon(Icons.add),),
// //       body:Column(
// //         children: [
// //           TextField(
// //             decoration: InputDecoration(
// //               border: OutlineInputBorder(),
// //               hintText: 'Search'
// //             ),
// //             onChanged: (value){
// //             ref.read(favouriteProvider.notifier).filterList(value);
// //             },
// //           ),
// //           Expanded(
// //               child:
// //               ListView.builder(
// //                   itemCount: favPro.filteredItems.length,
// //                   itemBuilder: (context,index){
// //                    final item = favPro.filteredItems[index];
// //                     return ListTile(
// //                       title: Text(item.name),
// //                       trailing: Icon(item.favourite? Icons.favorite:Icons.favorite_outline_rounded),
// //                     );
// //
// //           }))
// //         ],
// //       )
// //     );
// //   }
// // }
// //
// //
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // // import 'package:riverpod_practice/item_provider.dart';
// // //
// // // class Home extends ConsumerWidget {
// // //   const Home({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context,WidgetRef ref) {
// // //     final item = ref.watch(itemProvider);
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('StateNotifierProvider'),
// // //         centerTitle: true,
// // //         backgroundColor: Colors.blueAccent,
// // //       ),
// // //       floatingActionButton: FloatingActionButton(onPressed: (){
// // //         ref.read(itemProvider.notifier).addItem('New Item');
// // //       }),
// // //       body: item.isEmpty? Center(child: Text('No Data Found')):ListView.builder(
// // //           itemCount: item.length,
// // //           itemBuilder: (context,index){
// // //         final data = item[index];
// // //         return ListTile(
// // //           title: Text(data.name),
// // //           subtitle: Text(data.id),
// // //           trailing: Row(
// // //             mainAxisSize: MainAxisSize.min,
// // //             children: [
// // //               IconButton(onPressed: (){
// // //                 ref.read(itemProvider.notifier).updateItem(data.id,'irtaza');
// // //               }, icon: Icon(Icons.edit)),
// // //               IconButton(onPressed: (){
// // //               ref.read(itemProvider.notifier).deleteItem(data.id);
// // //               }, icon: Icon(Icons.delete)),
// // //             ],
// // //           ),
// // //         );
// // //
// // //       }),
// // //     );
// // //   }
// // // }
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // // //
// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // // // import 'package:riverpod_practice/search_provider.dart';
// // // // import 'package:riverpod_practice/slide_provider.dart';
// // // //
// // // // // final hello = StateProvider<int>((ref){
// // // // //   return 0;
// // // // // });
// // // // // final switchPro = StateProvider<bool>((ref){
// // // // //   return false;
// // // // // });
// // // //
// // // // class Home extends ConsumerWidget {
// // // //   const Home({super.key});
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context,WidgetRef ref) {
// // // //
// // // //     // print('countigngngn');
// // // //
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Riverpod'),
// // // //         centerTitle: true,
// // // //         backgroundColor: Colors.blueAccent,
// // // //       ),
// // // //       body: Column(
// // // //         mainAxisAlignment: MainAxisAlignment.center,
// // // //         children: [
// // // //           Consumer(builder: (context,ref,child){
// // // //             print('change');
// // // //             final searchP = ref.watch((searchProvider).select((state)=>state.isChange));
// // // //             return Switch(value:searchP , onChanged: (value){
// // // //               ref.read(searchProvider.notifier).isChange(value);
// // // //             });
// // // //           }),
// // // //           TextField(
// // // //             onChanged: (value){
// // // //               ref.read(searchProvider.notifier).search(value);
// // // //             },
// // // //           ),
// // // //           Consumer(builder: (context,ref,child){
// // // //             print('search');
// // // //             final searchP = ref.watch((searchProvider).select((state)=>state.search));
// // // //             return Text(searchP);
// // // //           }),
// // // //           Consumer(builder: (context,ref,child){
// // // //             print('vidlslel');
// // // //             final sliderD = ref.watch(sliderProvider.select((state)=>state.showPassword));
// // // //             return Center(
// // // //               child: InkWell(
// // // //                 onTap: (){
// // // //                   final slideProvider = ref.read(sliderProvider.notifier);
// // // //                   slideProvider.state=slideProvider.state.copyWith(showPassword: !sliderD);
// // // //                 },
// // // //                 child: Container(
// // // //                   height: 200,
// // // //                   width: 200,
// // // //                   child: sliderD?Icon(Icons.visibility):Icon(Icons.visibility_off)
// // // //                 ),
// // // //               ),
// // // //             );
// // // //           }),
// // // //           Consumer(builder: (context,ref,child){
// // // //             final sliderD = ref.watch(sliderProvider.select((state)=>state.slider));
// // // //             return Center(
// // // //               child: Container(
// // // //                 height: 200,
// // // //                 width: 200,
// // // //                 color: Colors.redAccent.withOpacity(sliderD),
// // // //               ),
// // // //             );
// // // //           }),
// // // //
// // // //           Consumer(builder: (context,ref,child){
// // // //             final sliderD = ref.watch(sliderProvider.select((state)=>state.slider));
// // // //             return Slider(value: sliderD, onChanged: (value){
// // // //               final stateProvider = ref.read(sliderProvider.notifier);
// // // //               stateProvider.state=stateProvider.state.copyWith(slider: value);
// // // //             });
// // // //           })
// // // //
// // // //           // Consumer(builder: (context,ref,child){
// // // //           //   print("contsessss");
// // // //           //   final counter = ref.watch(hello);
// // // //           //   return Center(child: Text(counter.toString(),style: TextStyle(
// // // //           //       fontSize: 30
// // // //           //   ),));
// // // //           // }),
// // // //           // Consumer(builder: (context,ref,child){
// // // //           //   final value = ref.watch(switchPro);
// // // //           //   return Switch(value: value, onChanged: (Value){
// // // //           //     ref.read(switchPro.notifier).state=Value;
// // // //           //   });
// // // //           // }),
// // // //
// // // //           // Row(
// // // //           //   mainAxisAlignment: MainAxisAlignment.center,
// // // //           //   children: [
// // // //           //     // ElevatedButton(onPressed: (){
// // // //           //     //   ref.read(hello.notifier).state++;
// // // //           //     // }, child: Icon(Icons.add)),
// // // //           //     // SizedBox(width: 10,),
// // // //           //     // ElevatedButton(onPressed: (){
// // // //           //     //   ref.read(hello.notifier).state--;
// // // //           //     // }, child: Icon(Icons.minimize)),
// // // //           //   ],
// // // //           // )
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // //
// // // // // class Home extends ConsumerStatefulWidget {
// // // // //   const Home({super.key});
// // // // //
// // // // //   @override
// // // // //   ConsumerState<Home> createState() => _HomeState();
// // // // // }
// // // // //
// // // // // class _HomeState extends ConsumerState<Home> {
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final hello2 = ref.watch(hello);
// // // // //     return Scaffold(
// // // // //       body: Column(
// // // // //         mainAxisAlignment: MainAxisAlignment.center,
// // // // //         children: [
// // // // //           Center(child: Text(hello2.toString(),style: TextStyle(fontSize: 30),)),
// // // // //        Row(
// // // // //          mainAxisAlignment: MainAxisAlignment.center,
// // // // //          children: [
// // // // //
// // // // //            ElevatedButton(onPressed: (){
// // // // //              ref.read(hello.notifier).state++;
// // // // //            }, child: Icon(Icons.add)),
// // // // //            ElevatedButton(onPressed: (){
// // // // //              ref.read(hello.notifier).state--;
// // // // //            }, child: Icon(Icons.minimize)),
// // // // //          ],
// // // // //        )
// // // // //
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // //
// // // // // class Home extends ConsumerWidget {
// // // // //   const Home({super.key});
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context,WidgetRef ref) {
// // // // //     final hello2 = ref.watch(hello);
// // // // //     return Scaffold(
// // // // //       body:
// // // // //       Column(
// // // // //         children: [
// // // // //           Text(hello2)
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
