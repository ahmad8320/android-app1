import 'dart:convert';
import 'package:http/http.dart' as http;

//يوشع منصور داود
//رهف وفيق شاهين
//احمد مفيد يوسف
class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;
  PostModel({this.userId, this.id, this.title, this.body});
  factory PostModel.fromJson(Map<String, dynamic> json)=>PostModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );
  }
//احمد مفيد يوسف
//محمد ابراهيم اسماعيل
//مجد شباني
// method for fetch data from API
Future<List<PostModel>> fetchPosts() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => PostModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

