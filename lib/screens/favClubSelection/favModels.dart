import 'package:flutter/material.dart';

class ListViewModel {
  final String name;
  final Image image;
  bool isSelected;
  final String type;
  final String value;

  ListViewModel(
      {this.type, this.name, this.isSelected, this.image, this.value});
}
