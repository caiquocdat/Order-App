import 'package:equatable/equatable.dart';
import 'product_model.dart';

import 'models.dart';

class Basket extends Equatable {
  final List<MenuItem> items;
  final bool cutlery;
  final Voucher? voucher;
  final DeliveryTime? deliveryTime;

  Basket({
    this.items = const <MenuItem>[],
    this.cutlery = false,
    this.voucher,
    this.deliveryTime,
  });

  Basket copyWith({
    List<MenuItem>? items,
    bool? cutlery,
    Voucher? voucher,
    DeliveryTime? deliveryTime,
  }) {
    return Basket(
      items: items ?? this.items,
      cutlery: cutlery ?? this.cutlery,
      voucher: voucher ?? this.voucher,
      deliveryTime: deliveryTime ?? this.deliveryTime,
    );
  }

  @override
  List<Object?> get props => [
        items,
        cutlery,
        voucher,
        deliveryTime,
      ];

  Map itemQuantity(products) {
    var quantity = Map();

    products.forEach((item) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      items.fold(0, (total, current) => total + current.price);

  double total(subtotal) {
    return (voucher == null) ? subtotal + 15 : subtotal + 15 - voucher!.value;
  }
  // toStringAsFixed lấy số giá trị sau dấu phẩy
  String get subtotalString => subtotal.toStringAsFixed(0);

  String get totalString => total(subtotal).toStringAsFixed(0);
}
