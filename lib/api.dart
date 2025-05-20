

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/post_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final postApiProvider = FutureProvider<List<PostModel>>((ref)async{
  List<PostModel> postList =[];
  try{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body.toString());
      for(var i in data){
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    }else{
      throw 'Error ';
    }

  }catch(e){
    rethrow;
  }

});