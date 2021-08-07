import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'chat_cubit_state.dart';

class ChatCubitCubit extends Cubit<ChatCubitState> {
  ChatCubitCubit() : super(ChatCubitState(chatlist: [],show: false));

  void chatupdated(chatlst) {
    emit(ChatCubitState(chatlist: chatlst,show: state.show));
  }

  void changeshow(boolgiven) {
    emit(ChatCubitState(chatlist: state.chatlist, show: boolgiven));
  }
}
