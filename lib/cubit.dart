import 'package:flutter/material.dart';
import 'package:ahmad/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//احمد مفيد يوسف
//ياسمين عبد الحسين حسن
class LikeCubit extends Cubit<LikeStates>{
  LikeCubit() : super( LikeInitState());
  static LikeCubit get(BuildContext context){
    return BlocProvider.of(context);
  }
  bool isLiked = false;
  void liked(){
    isLiked = true;
    emit(LikedState());
  }
  void uniked() {
    isLiked = false;
    emit(UnLikedState());
}
}