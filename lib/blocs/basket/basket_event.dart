part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();
}

class StartBasket extends BasketEvent {
  @override
  List<Object> get props => [];
}

class AddProduct extends BasketEvent {
  final MenuItem item;

  const AddProduct(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveProduct extends BasketEvent {
  final MenuItem item;

  const RemoveProduct(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveAllProduct extends BasketEvent {
  final MenuItem item;

  const RemoveAllProduct(this.item);

  @override
  List<Object> get props => [item];
}

class ToggleSwitch extends BasketEvent {
  const ToggleSwitch();

  @override
  List<Object?> get props => [];
}

class ApplyVoucher extends BasketEvent {
  final Voucher voucher;
  const ApplyVoucher(this.voucher);

  @override
  List<Object?> get props => [voucher];
}

class SelectDeliveryDay extends BasketEvent {
  const SelectDeliveryDay();

  @override
  List<Object?> get props => [];
}

class SelectDeliveryTime extends BasketEvent {
  final DeliveryTime deliveryTime;
  const SelectDeliveryTime(this.deliveryTime);

  @override
  List<Object?> get props => [deliveryTime];
}

class Pay extends BasketEvent {


  @override
  List<Object?> get props => [];
}
