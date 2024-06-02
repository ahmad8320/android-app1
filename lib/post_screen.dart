import 'package:ahmad/cubit.dart';
import 'package:ahmad/post_model.dart';
import 'package:ahmad/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//علي ماجد علي
//رهف وفيق شاهين
class PostScreen extends StatelessWidget {
  final PostModel post;

  PostScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LikeCubit(),
      child: BlocConsumer<LikeCubit, LikeStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          LikeCubit cubit = LikeCubit.get(context);
          return Scaffold(
            //علي  الكوسا
            appBar: AppBar(
              title: Text("${post.id}"),
              centerTitle: true,
            ),

            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
//ياسمين عبد الحسين حسن
                  //احمد مفيد يوسف
                    Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text("${post.title}")),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text("${post.body}")),
                    Icon(
                      cubit.isLiked
                          ? Icons.favorite
                          : Icons.favorite_border_rounded,
                      size: 50.0,
                      color: cubit.isLiked ? Colors.red : null,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              cubit.liked();
                            },
                            child: Text("Like")),
                        TextButton(
                            onPressed: () {
                              cubit.uniked();
                            },
                            child: Text("UnLike")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
