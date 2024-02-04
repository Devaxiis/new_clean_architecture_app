

import 'package:flutter/cupertino.dart';

extension ScrollControllerExtension on ScrollController{
  void onScrollEndListener(
      final Function() callBack,{
        double offset =0
  }
      ){
    addListener(() {
      final maxScroll = position.maxScrollExtent;
      final currentScroll = position.pixels - offset;
      if(currentScroll == maxScroll){
        callBack();
      }
    });
  }
}