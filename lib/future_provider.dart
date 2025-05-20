
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fPro = FutureProvider<List<String>>((ref)async{
  await Future.delayed(Duration(seconds: 2));
  return ['Irtaza','Khalid','Abdullah','Badshah','Abu bakr','Zaid'];
});