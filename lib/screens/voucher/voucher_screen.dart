import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/basket/basket_bloc.dart';
import '../../blocs/voucher/voucher_bloc.dart';
import '../../models/voucher_model.dart';
import '../../repositories/voucher/voucher_repository.dart';

class VoucherScreen extends StatelessWidget {
  static const String routeName = '/vouchers';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => VoucherScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController voucherController = TextEditingController();
    List<Voucher> voucherCopy=[Voucher(id: '1', code: 'KM5', value: 5)];
    return Scaffold(
      appBar: AppBar(
        title: Text('Mã khuyến mãi', style: Theme
            .of(context)
            .textTheme
            .headline3),
        centerTitle: true,
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
                  primary: Theme
                      .of(context)
                      .colorScheme
                      .secondary,
                ),
                child: Text('Thêm'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nhập mã khuyến mãi',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4!
                  .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .secondary,
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: voucherController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: 'Mã khuyến mãi',
                      ),
                      onChanged: (value) async {

                        // print(await VoucherRepository().searchVoucher(value));
                        voucherCopy=await VoucherRepository().searchVoucher(value);
                        print(voucherCopy.length);
                        if(voucherCopy.length>0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Bạn được khuyến mãi ${voucherCopy[0].value.ceil()}k'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          context.read<VoucherBloc>().add(
                            SelectVoucher(
                                voucher: voucherCopy[0]),
                          );
                        }

                      },

                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Mã khuyến mãi của bạn',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4!
                  .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .secondary,
              ),
            ),



            BlocBuilder<VoucherBloc, VoucherState>(
              builder: (context, state) {
                if (state is VoucherLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is VoucherLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.vouchers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '3x',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                voucherCopy[index].code,
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                visualDensity: VisualDensity.compact,
                              ),
                              onPressed: () {
                                context.read<VoucherBloc>().add(
                                  SelectVoucher(
                                      voucher: voucherCopy[index]),
                                );
                                Navigator.of(context).pop();
                              },
                              child: Text('Sử dụng'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top:8),
                    child: Text('Bạn chỉ được thêm 1 mã khuyến mãi'),
                  );
                }
              },
            )
          ],
        ),)
      ,
    );
  }
}