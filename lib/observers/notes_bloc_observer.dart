import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint("change: $change");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint("close: $bloc");
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint("create: $bloc");
  }
}
