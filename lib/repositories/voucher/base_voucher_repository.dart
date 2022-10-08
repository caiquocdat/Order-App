import '../../models/models.dart';

abstract class BaseVoucherRepository {
  Future<List<Voucher>> searchVoucher(String code);
  Stream<List<Voucher>> getVouchers(String code);
}
