import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/voucher_model.dart';

import 'base_voucher_repository.dart';

class VoucherRepository extends BaseVoucherRepository {
  final FirebaseFirestore _firebaseFirestore;

  VoucherRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Voucher>> getVouchers(String code) {
    return _firebaseFirestore
        .collection('vouchers')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Voucher.fromSnapshot(doc)).where((voucher) =>
      (voucher.code.contains(code))).toList();
    });
  }

  @override
  Future<List<Voucher>> searchVoucher(String code) async {
    final voucher = await _firebaseFirestore
        .collection('vouchers')
        .where('code', isEqualTo: code)
        .get();
    // print('${voucher.docs.map((doc) => Voucher.fromSnapshot(doc)).toList()}');

    return voucher.docs.map((doc) => Voucher.fromSnapshot(doc)).toList();
  }
}
