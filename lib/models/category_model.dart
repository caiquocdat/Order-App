

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final String id;
  final String name;
  // final String description;
  final Image imageUrl;
  // final int index;

  Category({
    required this.id,
    required this.name,
    // required this.description,
    required this.imageUrl,
    // required this.index,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    // description,
    imageUrl,
    // index
  ];

  static List<Category> categories = [
    Category(
      id: '1',
      name: 'Đồ uống',
      // description: 'This is a test description',
      imageUrl: Image.asset('assets/juice.png'),
      // index: 0,
    ),
    Category(
      id: '2',
      name: 'Bún',
      // description: 'This is a test description',
      imageUrl: Image.asset('assets/pizza.png'),
      // index: 1,
    ),
    Category(
      id: '3',
      name: 'Chè',
      // description: 'This is a test description',
      imageUrl: Image.asset('assets/burger.png'),
      // index: 2,
    ),
    Category(
      id: '4',
      name: 'Mỳ cay',
      // description: 'This is a test description',
      imageUrl: Image.asset('assets/pancake.png'),
      // index: 3,
    ),
    Category(
      id: '5',
      name: 'Cơm',
      // description: 'This is a test description',
      imageUrl: Image.asset('assets/avocado.png'),
      // index: 4,
    ),
  ];
}
