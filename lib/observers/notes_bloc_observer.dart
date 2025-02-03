import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("change: $change");
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("close: $bloc");
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("create: $bloc");
  }
}
