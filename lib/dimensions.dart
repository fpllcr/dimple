import 'package:flutter/material.dart';

class Dimensions {
  double height, width;

  Dimensions(BuildContext context){
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }

  
}