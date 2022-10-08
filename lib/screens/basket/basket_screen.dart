import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orderapp/models/basket_model.dart';

import '../../blocs/basket/basket_bloc.dart';

class BasketScreen extends StatelessWidget {
  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   // TODO: implement didChangeAppLifecycleState
  //   super.didChangeAppLifecycleState(state);
  //   if (state == AppLifecycleState.paused) {
  //     print('App is in Backgroud mode');
  //   } else if (state == AppLifecycleState.resumed) {
  //     print('App is in Foregroud mode');
  //   }
  // }

  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => BasketScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int countItem = 0;
    return WillPopScope(
        child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              title: Text('Giỏ hàng',
                  style: Theme.of(context).textTheme.headline3),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit-basket');
                    },
                    icon: Icon(Icons.edit))
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(),
                        primary: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Text('Thanh Toán'),
                      onPressed: () {
                        if (countItem == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Vui lòng chọn sản phẩm trước khi thanh toán!!!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          context.read<BasketBloc>()..add(Pay());
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Đơn hàng của bạn đang được kiểm tra và thanh toán. Vui lòng chờ trong giây lát!!!'),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lưu đơn hàng',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Bạn có muốn lưu lại đơn?',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          BlocBuilder<BasketBloc, BasketState>(
                            builder: (context, state) {
                              if (state is BasketLoading) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              if (state is BasketLoaded) {
                                return SizedBox(
                                  width: 100,
                                  child: SwitchListTile(
                                      dense: false,
                                      value: state.basket.cutlery,
                                      activeColor:
                                          Theme.of(context).colorScheme.primary,
                                      onChanged: (bool? newValue) {
                                        context.read<BasketBloc>().add(
                                              ToggleSwitch(),
                                            );
                                      }),
                                );
                              } else {
                                return Text('Something went wrong.');
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Sản phẩm',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is BasketLoaded) {
                          countItem = 0;
                          return state.basket.items.length == 0
                              ? Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(top: 5),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Bạn chưa chọn món',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.basket
                                      .itemQuantity(state.basket.items)
                                      .keys
                                      .length,
                                  itemBuilder: (context, index) {
                                    countItem = 1;
                                    return Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 5),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}x',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}',
                                              textAlign: TextAlign.left,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                          ),
                                          Text(
                                            '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).price}k',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                        } else {
                          return Text('Something went wrong.');
                        }
                      },
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/delivery_time.svg'),
                          BlocBuilder<BasketBloc, BasketState>(
                            builder: (context, state) {
                              if (state is BasketLoaded) {
                                return (state.basket.deliveryTime == null)
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 20),
                                          Text(
                                            'Giao trong 30 phút',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/delivery-time');
                                            },
                                            child: Text(
                                              'Thay đổi',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6!
                                                  .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Quán chuẩn bị ${state.basket.deliveryTime!.cokingTime}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 16, bottom: 16),
                                            child: Text(
                                              'Giao trong ${state.basket.deliveryTime!.value}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                          ),
                                          Text(
                                            'Giao lúc ${state.basket.deliveryTime!.time}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                        ],
                                      );
                              } else {
                                return Text('Something went wrong');
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<BasketBloc, BasketState>(
                            builder: (context, state) {
                              if (state is BasketLoaded) {
                                return (state.basket.voucher == null)
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Thêm mã khuyến mãi!',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, '/vouchers');
                                              },
                                              child: Text(
                                                'Thêm',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6!
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .accentColor),
                                              ))
                                        ],
                                      )
                                    : Text(
                                        'Mã khuyến mãi đã được thêm',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      );
                              } else {
                                return Text('Something went wrong');
                              }
                            },
                          ),
                          Image.asset('assets/voucher.png')
                        ],
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        height: 100,
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: BlocBuilder<BasketBloc, BasketState>(
                          builder: (context, state) {
                            if (state is BasketLoading) {
                              return Center(child: CircularProgressIndicator());
                            }

                            if (state is BasketLoaded) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tiền hàng',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      Text(
                                        '${state.basket.subtotalString}k',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Phí giao hàng',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      Text(
                                        '15k',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tổng tiền',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                      ),
                                      Text(
                                        '${state.basket.totalString}k',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            } else {
                              return Text('Something went wrong');
                            }
                          },
                        ))
                  ],
                ),
              ),
            )),
        onWillPop: (){
          context.read<BasketBloc>()..add(Pay());
          Navigator.pop(context, false);
          return Future.value(false);
        }
    );
  }

}
