import 'dart:convert';
import 'main.dart';
import 'package:flutter/material.dart' ;
import 'home_screen.dart';
import 'package:http/http.dart' as http;
class home extends StatelessWidget {
Future<List> getData() async {
  var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  var issonData = jsonDecode(response.body) as List;
  return issonData;
}@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API2'),),
      body: FutureBuilder<List>(
    future: getData(),
    builder: (context,Snapshot){
    if(Snapshot.hasData){
    return ListView.builder(
    itemCount: Snapshot.data!.length,//جلب بيانات المصفوفة بالكامل
    itemBuilder: (context, index){
      return ListTile(
          title: Text('${Snapshot.data![index]['title']}'),
      subtitle: Text('${Snapshot.data![index]['id']}')//نستخدم index لاستخراج جميع البيانات

    );
    });}
    else if(Snapshot.hasError){
      return Center(child:Text(Snapshot.error.toString())); //Icon(Icons.error_outline);
    }
    else{
      return CircularProgressIndicator();
    }

    }),
     );
}
}