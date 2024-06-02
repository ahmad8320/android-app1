import 'dart:async';
import 'dart:convert';

import 'package:ahmad/post_model.dart';
import 'package:ahmad/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//احمد مفيد يوسف
//
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }
//اسماعيل هيثم سلوم
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data from API',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data from API'),
        ),
        body: Center(
          child: FutureBuilder<List<PostModel>?>(
            future: fetchPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 4,
                            offset: Offset(4, 8), // Shadow position
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  PostScreen(post: snapshot.data![index])));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${snapshot.data![index].id}",
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              "${snapshot.data![index].title}",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            Text(
                              overflow: snapshot.data![index].body!.length > 2
                                  ? TextOverflow.ellipsis
                                  : null,
                              "${snapshot.data![index].body}",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
