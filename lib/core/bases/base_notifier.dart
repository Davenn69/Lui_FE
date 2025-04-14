import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class BaseNotifier extends ChangeNotifier{
  bool _isLoading = false;
  bool _isInitialized = false;
  bool _isDisposed = false;
  bool _showOverlay = false;

  final Ref<Object?> ref;

  BaseNotifier(this.ref){
    _init();
  }

  void _init()async{
    _isLoading = true;
    await init();
    _isInitialized = true;
    _isLoading = false;
  }

  @override
  void dispose(){
    _isDisposed = true;
    super.dispose();
  }

  bool get isLoading => _isLoading;
  bool get isInitialized => _isInitialized;
  bool get isDisposed => _isDisposed;

  set isLoading(bool value){
    _isLoading = value;
    scheduleMicrotask((){
      if(!_isDisposed) notifyListeners();
    });
  }

  set showOverlay(bool value){
    _showOverlay = value;
    scheduleMicrotask((){
      if(!_isDisposed) notifyListeners();
    });
  }

}