
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/slide_provider.dart';

// final hello = StateProvider<int>((ref){
//   return 0;
// });
// final switchPro = StateProvider<bool>((ref){
//   return false;
// });

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    // print('countigngngn');

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context,ref,child){
            final sliderD = ref.watch(sliderProvider);
            return Center(
              child: Container(
                height: 200,
                width: 200,
                color: Colors.redAccent.withOpacity(sliderD),
              ),
            );
          }),

          Consumer(builder: (context,ref,child){
            final sliderD = ref.watch(sliderProvider);
            return Slider(value: sliderD, onChanged: (value){
              ref.read(sliderProvider.notifier).state=value;
            });
          })

          // Consumer(builder: (context,ref,child){
          //   print("contsessss");
          //   final counter = ref.watch(hello);
          //   return Center(child: Text(counter.toString(),style: TextStyle(
          //       fontSize: 30
          //   ),));
          // }),
          // Consumer(builder: (context,ref,child){
          //   final value = ref.watch(switchPro);
          //   return Switch(value: value, onChanged: (Value){
          //     ref.read(switchPro.notifier).state=Value;
          //   });
          // }),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     // ElevatedButton(onPressed: (){
          //     //   ref.read(hello.notifier).state++;
          //     // }, child: Icon(Icons.add)),
          //     // SizedBox(width: 10,),
          //     // ElevatedButton(onPressed: (){
          //     //   ref.read(hello.notifier).state--;
          //     // }, child: Icon(Icons.minimize)),
          //   ],
          // )
        ],
      ),
    );
  }
}


// class Home extends ConsumerStatefulWidget {
//   const Home({super.key});
//
//   @override
//   ConsumerState<Home> createState() => _HomeState();
// }
//
// class _HomeState extends ConsumerState<Home> {
//   @override
//   Widget build(BuildContext context) {
//     final hello2 = ref.watch(hello);
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(child: Text(hello2.toString(),style: TextStyle(fontSize: 30),)),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//
//            ElevatedButton(onPressed: (){
//              ref.read(hello.notifier).state++;
//            }, child: Icon(Icons.add)),
//            ElevatedButton(onPressed: (){
//              ref.read(hello.notifier).state--;
//            }, child: Icon(Icons.minimize)),
//          ],
//        )
//
//         ],
//       ),
//     );
//   }
// }

// class Home extends ConsumerWidget {
//   const Home({super.key});
//
//   @override
//   Widget build(BuildContext context,WidgetRef ref) {
//     final hello2 = ref.watch(hello);
//     return Scaffold(
//       body:
//       Column(
//         children: [
//           Text(hello2)
//         ],
//       ),
//     );
//   }
// }
