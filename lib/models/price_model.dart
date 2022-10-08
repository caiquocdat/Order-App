import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final int id;
  final String price;

  Price({
    required this.id,
    required this.price,
  });

  @override
  List<Object?> get props => [id, price];

  static List<Price> prices = [
    Price(id: 1, price: '\20k'),
    Price(id: 2, price: '\30k'),
    Price(id: 3, price: '\50k'),
  ];
}
