import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final int price;

  const MenuItem({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        category,
        description,
        price,
      ];

  static List<MenuItem> menuItems = [
    MenuItem(
      id: 1,
      restaurantId: 1,
      name: 'Cơm tấm sườn bì chả',
      category: 'Cơm',
      description: 'Sườn, Bì, Chả...',
      price: 30,
    ),
    MenuItem(
      id: 2,
      restaurantId: 1,
      name: 'Cơm tấm sườn opla',
      category: 'Cơm',
      description: 'Sườn, Opla, Canh...',
      price: 25,
    ),
    MenuItem(
      id: 3,
      restaurantId: 1,
      name: 'Cơm tấm sườn lạp xưởng',
      category: 'Cơm',
      description: 'Sườn, Lạp xưởng, Canh...',
      price: 25,
    ),
    MenuItem(
      id: 4,
      restaurantId: 1,
      name: 'Cơm tấm đặc biệt',
      category: 'Cơm',
      description: 'Sườn, Opla, Lạp xưởng...',
      price: 50,
    ),
    MenuItem(
      id: 5,
      restaurantId: 1,
      name: 'Coca Cola',
      category: 'Đồ uống',
      description: 'Uống với đá',
      price: 20,
    ),
    MenuItem(
      id: 6,
      restaurantId: 1,
      name: 'Trà xanh không độ',
      category: 'Đồ uống',
      description: 'Uống với đá',
      price: 20,
    ),
    MenuItem(
      id: 7,
      restaurantId: 1,
      name: '7Up',
      category: 'Đồ uống',
      description: 'Uống với đá',
      price: 20,
    ),
    MenuItem(
      id: 8,
      restaurantId: 1,
      name: 'Numberone',
      category: 'Đồ uống',
      description: 'Uống với đá',
      price: 20,
    ),
    MenuItem(
      id: 9,
      restaurantId: 2,
      name: 'Combo 1',
      category: 'Gà rán',
      description: '1 gà rán, 1 khoai tây chiên',
      price: 50,
    ),
    MenuItem(
      id: 10,
      restaurantId: 2,
      name: 'Combo 2',
      category: 'Gà rán',
      description: '1 gà rán, 1 khoai tây chiên, 1 nước tự chọn',
      price: 60,
    ),
    MenuItem(
      id: 11,
      restaurantId: 2,
      name: 'Combo 3',
      category: 'Gà rán',
      description: '1 gà rán, 1 khoai tây chiên, 1 mỳ ý, 1 nước tự chọn',
      price: 90,
    ),
    MenuItem(
      id: 12,
      restaurantId: 2,
      name: 'Combo 4',
      category: 'Gà rán',
      description: '2 gà rán, 2 khoai tây chiên, 1 mỳ ý, 2 nước',
      price: 150,
    ),
    MenuItem(
      id: 13,
      restaurantId: 2,
      name: 'Pepsi',
      category: 'Đồ uống',
      description: 'Nhỏ',
      price: 10,
    ),
    MenuItem(
      id: 14,
      restaurantId: 2,
      name: 'Pepsi',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 15,
    ),
    MenuItem(
      id: 15,
      restaurantId: 2,
      name: '7 Up',
      category: 'Đồ uống',
      description: 'Nhỏ',
      price: 10,
    ),
    MenuItem(
      id: 16,
      restaurantId: 2,
      name: '7 Up',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 15,
    ),
    MenuItem(
      id: 17,
      restaurantId: 2,
      name: 'Nước cam',
      category: 'Đồ uống',
      description: 'Nhỏ',
      price: 10,
    ),
    MenuItem(
      id: 18,
      restaurantId: 2,
      name: 'Nước cam',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 15,
    ),
    MenuItem(
      id: 19,
      restaurantId: 3,
      name: 'Trà đào',
      category: 'Đồ uống',
      description: 'Nhỏ',
      price: 30,
    ),
    MenuItem(
      id: 20,
      restaurantId: 3,
      name: 'Trà đào',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 40,
    ),
    MenuItem(
      id: 21,
      restaurantId: 3,
      name: 'Trà vãi',
      category: 'Đồ uống',
      description: 'Nhỏ',
      price: 30,
    ),
    MenuItem(
      id: 22,
      restaurantId: 3,
      name: 'Trà vãi',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 40,
    ),
    MenuItem(
      id: 23,
      restaurantId: 3,
      name: 'Trà sữa kem cheese',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 35,
    ),
    MenuItem(
      id: 24,
      restaurantId: 3,
      name: 'Trà sữa kem trứng',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 40,
    ),
    MenuItem(
      id: 25,
      restaurantId: 4,
      name: 'Bún riêu',
      category: 'Bún',
      description: 'Nhỏ',
      price: 25,
    ),
    MenuItem(
      id: 26,
      restaurantId: 4,
      name: 'Bún riêu',
      category: 'Bún',
      description: 'Lớn',
      price: 35,
    ),
    MenuItem(
      id: 27,
      restaurantId: 4,
      name: 'Bún riêu chả',
      category: 'Bún',
      description: 'Nhỏ',
      price: 30,
    ),
    MenuItem(
      id: 28,
      restaurantId: 4,
      name: 'Bún riêu chả',
      category: 'Bún',
      description: 'Lớn',
      price: 40,
    ),
    MenuItem(
      id: 29,
      restaurantId: 4,
      name: '7 Up',
      category: 'Đồ uống',
      description: 'Kèm theo đá',
      price: 12,
    ),
    MenuItem(
      id: 30,
      restaurantId: 4,
      name: 'Coca',
      category: 'Đồ uống',
      description: 'Kèm theo đá',
      price: 12,
    ),
    MenuItem(
      id: 31,
      restaurantId: 5,
      name: 'Milo dầm',
      category: 'Đồ uống',
      description: 'Nhỏ',
      price: 25,
    ),
    MenuItem(
      id: 32,
      restaurantId: 5,
      name: 'Milo dầm',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 35,
    ),
    MenuItem(
      id: 33,
      restaurantId: 5,
      name: 'Trà trái cây',
      category: 'Đồ uống',
      description: 'Nhỏ',
      price: 30,
    ),
    MenuItem(
      id: 34,
      restaurantId: 5,
      name: 'Trà trái cây',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 40,
    ),
    MenuItem(
      id: 35,
      restaurantId: 5,
      name: 'Trà đào cam sả',
      category: 'Đồ uống',
      description: 'Nhỏ',
      price: 25,
    ),
    MenuItem(
      id: 36,
      restaurantId: 5,
      name: 'Trà đào cam sả',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 35,
    ),
    MenuItem(
      id: 37,
      restaurantId: 5,
      name: 'Trà sữa khoai môn',
      category: 'Đồ uống',
      description: 'Nhỏ',
      price: 25,
    ),
    MenuItem(
      id: 38,
      restaurantId: 5,
      name: 'Trà sữa khoai môn',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 35,
    ),
    MenuItem(
      id: 39,
      restaurantId: 6,
      name: 'Bánh canh sươn chả',
      category: 'Bánh canh',
      description: 'Nhỏ',
      price: 25,
    ),
    MenuItem(
      id: 40,
      restaurantId: 6,
      name: 'Bánh canh sươn chả',
      category: 'Bánh canh',
      description: 'Lớn',
      price: 35,
    ),
    MenuItem(
      id: 41,
      restaurantId: 6,
      name: 'Bánh canh trứng chả',
      category: 'Bánh canh',
      description: 'Nhỏ',
      price: 20,
    ),
    MenuItem(
      id: 42,
      restaurantId: 6,
      name: 'Bánh canh trứng chả',
      category: 'Bánh canh',
      description: 'Lớn',
      price: 30,
    ),
    MenuItem(
      id: 43,
      restaurantId: 6,
      name: 'Bánh canh đặc biệt',
      category: 'Bánh canh',
      description: 'Gồm tôm, chả, trứng, sươn...',
      price: 40,
    ),
    MenuItem(
      id: 44,
      restaurantId: 6,
      name: 'Quẩy',
      category: 'Đồ ăn thêm',
      description: '1 cặp quẩy',
      price: 5,
    ),
    MenuItem(
      id: 45,
      restaurantId: 6,
      name: 'Trứng cút',
      category: 'Đồ ăn thêm',
      description: '1 quả',
      price: 1,
    ),
    MenuItem(
      id: 46,
      restaurantId: 6,
      name: 'Chả',
      category: 'Đồ ăn thêm',
      description: '1 phần',
      price: 10,
    ),
    MenuItem(
      id: 47,
      restaurantId: 7,
      name: 'Mẹt cơ bản',
      category: 'Bún',
      description: 'Gồm bún, đậu, thịt luộc',
      price: 30,
    ),
    MenuItem(
      id: 48,
      restaurantId: 7,
      name: 'Mẹt phần 2 người ăn',
      category: 'Bún',
      description: 'Gồm bún, đậu, thịt luộc, chả cốm, dồi',
      price: 40,
    ),
    MenuItem(
      id: 49,
      restaurantId: 7,
      name: 'Mẹt đặc biệt',
      category: 'Bún',
      description: 'Gồm bún, đậu, thịt luộc, chả cốm, dồi, chả lụa, ram tôm',
      price: 60,
    ),
    MenuItem(
      id: 50,
      restaurantId: 7,
      name: 'Nước mơ',
      category: 'Đồ uống',
      description: '1 phần kèm đá',
      price: 15,
    ),
    MenuItem(
      id: 51,
      restaurantId: 7,
      name: 'Nước sấu',
      category: 'Đồ uống',
      description: '1 phần kèm đá',
      price: 15,
    ),
    MenuItem(
      id: 52,
      restaurantId: 7,
      name: 'Trà tắc',
      category: 'Đồ uống',
      description: '1 phần kèm đá',
      price: 15,
    ),
    MenuItem(
      id: 53,
      restaurantId: 8,
      name: 'Mẹt 1',
      category: 'Bún',
      description: 'Gồm bún, đậu, thịt luộc',
      price: 30,
    ),
    MenuItem(
      id: 54,
      restaurantId: 8,
      name: 'Mẹt 2',
      category: 'Bún',
      description: 'Gồm bún, đậu, thịt luộc, chả cốm, dồi',
      price: 40,
    ),
    MenuItem(
      id: 55,
      restaurantId: 8,
      name: 'Mẹt 3',
      category: 'Bún',
      description: 'Gồm bún, đậu, thịt luộc, chả cốm, dồi, chả lụa, ram tôm',
      price: 60,
    ),
    MenuItem(
      id: 56,
      restaurantId: 8,
      name: 'Nước mơ',
      category: 'Đồ uống',
      description: '1 phần kèm đá',
      price: 15,
    ),
    MenuItem(
      id: 57,
      restaurantId: 8,
      name: 'Nước sấu',
      category: 'Đồ uống',
      description: '1 phần kèm đá',
      price: 15,
    ),
    MenuItem(
      id: 58,
      restaurantId: 8,
      name: 'Trà tắc',
      category: 'Đồ uống',
      description: '1 phần kèm đá',
      price: 15,
    ),
    MenuItem(
      id: 59,
      restaurantId: 9,
      name: 'Bánh cuốn chả trứng',
      category: 'Bánh cuốn',
      description: 'Nhỏ',
      price: 25,
    ),
    MenuItem(
      id: 60,
      restaurantId: 9,
      name: 'Bánh cuốn chả trứng',
      category: 'Bánh cuốn',
      description: 'Lớn',
      price: 35,
    ),
    MenuItem(
      id: 61,
      restaurantId: 9,
      name: 'Bánh cuốn nem chả',
      category: 'Bánh cuốn',
      description: 'Nhỏ',
      price: 25,
    ),
    MenuItem(
      id: 62,
      restaurantId: 9,
      name: 'Bánh cuốn nem chả',
      category: 'Bánh cuốn',
      description: 'Lớn',
      price: 35,
    ),
    MenuItem(
      id: 63,
      restaurantId: 9,
      name: 'Bánh cuốn đặc biệt',
      category: 'Bánh cuốn',
      description: 'Gồm chả, nem, trứng...',
      price: 40,
    ),
    MenuItem(
      id: 64,
      restaurantId: 9,
      name: 'Chả',
      category: 'Đồ ăn thêm',
      description: '1 cái chả',
      price: 5,
    ),
    MenuItem(
      id: 65,
      restaurantId: 9,
      name: 'Nem',
      category: 'Đồ ăn thêm',
      description: '1 cái nem',
      price: 5,
    ),
    MenuItem(
      id: 66,
      restaurantId: 9,
      name: 'Trứng',
      category: 'Đồ ăn thêm',
      description: '1 cái trứng',
      price: 5,
    ),
    MenuItem(
      id: 67,
      restaurantId: 10,
      name: 'Chè thái',
      category: 'Chè',
      description: 'Chè có sầu riêng',
      price: 25,
    ),
    MenuItem(
      id: 68,
      restaurantId: 10,
      name: 'Chè thái',
      category: 'Chè',
      description: 'Chè không có sầu riêng',
      price: 20,
    ),
    MenuItem(
      id: 69,
      restaurantId: 10,
      name: 'Chè đậu xanh',
      category: 'Chè',
      description: 'Nhỏ',
      price: 15,
    ),
    MenuItem(
      id: 70,
      restaurantId: 10,
      name: 'Chè đậu xanh',
      category: 'Chè',
      description: 'Lớn',
      price: 20,
    ),
    MenuItem(
      id: 71,
      restaurantId: 10,
      name: 'Chè đậu đỏ',
      category: 'Chè',
      description: 'Nhỏ',
      price: 15,
    ),
    MenuItem(
      id: 72,
      restaurantId: 10,
      name: 'Chè đậu đỏ',
      category: 'Chè',
      description: 'Lớn',
      price: 20,
    ),
    MenuItem(
      id: 73,
      restaurantId: 10,
      name: 'Chè trái cây',
      category: 'Chè',
      description: 'Nhỏ',
      price: 25,
    ),
    MenuItem(
      id: 74,
      restaurantId: 10,
      name: 'Chè trái cây',
      category: 'Chè',
      description: 'Lớn',
      price: 35,
    ),
    MenuItem(
      id: 75,
      restaurantId: 11,
      name: 'Milo dầm',
      category: 'Đồ uống',
      description: 'Nhỏ',
      price: 25,
    ),
    MenuItem(
      id: 76,
      restaurantId: 11,
      name: 'Milo dầm',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 35,
    ),
    MenuItem(
      id: 77,
      restaurantId: 11,
      name: 'Trà trái cây',
      category: 'Đồ uống',
      description: 'Nhỏ',
      price: 30,
    ),
    MenuItem(
      id: 78,
      restaurantId: 11,
      name: 'Trà trái cây',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 40,
    ),
    MenuItem(
      id: 79,
      restaurantId: 11,
      name: 'Trà đào cam sả',
      category: 'Đồ uống',
      description: 'Nhỏ',
      price: 25,
    ),
    MenuItem(
      id: 80,
      restaurantId: 11,
      name: 'Trà đào cam sả',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 35,
    ),
    MenuItem(
      id: 81,
      restaurantId: 11,
      name: 'Trà sữa khoai môn',
      category: 'Đồ uống',
      description: 'Nhỏ',
      price: 25,
    ),
    MenuItem(
      id: 82,
      restaurantId: 11,
      name: 'Trà sữa khoai môn',
      category: 'Đồ uống',
      description: 'Lớn',
      price: 35,
    ),
    MenuItem(
      id: 83,
      restaurantId: 12,
      name: 'Chè đậu xanh',
      category: 'Chè',
      description: 'Nhỏ',
      price: 15,
    ),
    MenuItem(
      id: 84,
      restaurantId: 12,
      name: 'Chè đậu xanh',
      category: 'Chè',
      description: 'Lớn',
      price: 25,
    ),
    MenuItem(
      id: 85,
      restaurantId: 12,
      name: 'Chè đậu đỏ',
      category: 'Chè',
      description: 'Nhỏ',
      price: 15,
    ),
    MenuItem(
      id: 86,
      restaurantId: 12,
      name: 'Chè đậu đỏ',
      category: 'Chè',
      description: 'Lớn',
      price: 25,
    ),
    MenuItem(
      id: 87,
      restaurantId: 12,
      name: 'Chè thái',
      category: 'Chè',
      description: 'Có sầu riêng',
      price: 25,
    ),
    MenuItem(
      id: 88,
      restaurantId: 12,
      name: 'Chè thái',
      category: 'Chè',
      description: 'Không sầu riêng',
      price: 35,
    ),
    MenuItem(
      id: 89,
      restaurantId: 12,
      name: 'Chè dừa dầm',
      category: 'Chè',
      description: 'Nhỏ',
      price: 20,
    ),
    MenuItem(
      id: 90,
      restaurantId: 12,
      name: 'Chè dừa dầm',
      category: 'Chè',
      description: 'Lớn',
      price: 30,
    ),
    MenuItem(
      id: 91,
      restaurantId: 13,
      name: 'Mỳ cay hải sản',
      category: 'Mỳ cay',
      description: 'Tôm, cá viên, bò viên',
      price: 35,
    ),
    MenuItem(
      id: 92,
      restaurantId: 13,
      name: 'Mỳ cay bò',
      category: 'Mỳ cay',
      description: 'Thịt bò, cá viên, tôm viên',
      price: 35,
    ),
    MenuItem(
      id: 93,
      restaurantId: 13,
      name: 'Mỳ cay xúc xích',
      category: 'Mỳ cay',
      description: 'Xúc xích, cá viên, bò viên',
      price: 35,
    ),
    MenuItem(
      id: 94,
      restaurantId: 13,
      name: 'Mỳ cay đặc biệt',
      category: 'Mỳ cay',
      description: 'Tôm, thịt bò, cá viên, tôm viên',
      price: 55,
    ),
    MenuItem(
      id: 95,
      restaurantId: 13,
      name: 'Coca',
      category: 'Đồ uống',
      description: '1 lon kèm đá',
      price: 15,
    ),
    MenuItem(
      id: 96,
      restaurantId: 13,
      name: '7 Up',
      category: 'Đồ uống',
      description: '1 lon kèm đá',
      price: 15,
    ),
    MenuItem(
      id: 97,
      restaurantId: 14,
      name: 'Cơm tấm sườn bì chả',
      category: 'Cơm',
      description: 'Sườn, Bì, Chả...',
      price: 30,
    ),
    MenuItem(
      id: 98,
      restaurantId: 14,
      name: 'Cơm tấm sườn opla',
      category: 'Cơm',
      description: 'Sườn, Opla, Canh...',
      price: 25,
    ),
    MenuItem(
      id: 99,
      restaurantId: 14,
      name: 'Cơm tấm sườn lạp xưởng',
      category: 'Cơm',
      description: 'Sườn, Lạp xưởng, Canh...',
      price: 25,
    ),
    MenuItem(
      id: 100,
      restaurantId: 14,
      name: 'Cơm tấm đặc biệt',
      category: 'Cơm',
      description: 'Sườn, Opla, Lạp xưởng...',
      price: 50,
    ),
    MenuItem(
      id: 101,
      restaurantId: 14,
      name: 'Cơm thêm',
      category: 'Đồ ăn thêm',
      description: '1 phần nhỏ',
      price: 10,
    ),
    MenuItem(
      id: 102,
      restaurantId: 14,
      name: 'Cơm thêm',
      category: 'Đồ ăn thêm',
      description: '1 phần lớn',
      price: 20,
    ),
    MenuItem(
      id: 103,
      restaurantId: 14,
      name: 'Trứng thêm',
      category: 'Đồ ăn thêm',
      description: '1 cái',
      price: 10,
    ),
    MenuItem(
      id: 104,
      restaurantId: 14,
      name: 'Sườn thêm',
      category: 'Đồ ăn thêm',
      description: '1 cái',
      price: 20,
    ),
    MenuItem(
      id: 105,
      restaurantId: 14,
      name: 'Coca Cola',
      category: 'Đồ uống',
      description: 'Uống với đá',
      price: 20,
    ),
    MenuItem(
      id: 106 ,
      restaurantId: 14,
      name: 'Trà xanh không độ',
      category: 'Đồ uống',
      description: 'Uống với đá',
      price: 20,
    ),
    MenuItem(
      id: 107,
      restaurantId: 14,
      name: '7Up',
      category: 'Đồ uống',
      description: 'Uống với đá',
      price: 20,
    ),
    MenuItem(
      id: 108,
      restaurantId: 14,
      name: 'Numberone',
      category: 'Đồ uống',
      description: 'Uống với đá',
      price: 20,
    ),
    MenuItem(
      id: 109,
      restaurantId: 15,
      name: 'Bánh mỳ opla chả',
      category: 'Bánh mỳ',
      description: '1 trứng',
      price: 10,
    ),
    MenuItem(
      id: 110,
      restaurantId: 15,
      name: 'Bánh mỳ opla chả',
      category: 'Bánh mỳ',
      description: '2 trứng',
      price: 15,
    ),
    MenuItem(
      id: 111,
      restaurantId: 15,
      name: 'Bánh mỳ opla thịt',
      category: 'Bánh mỳ',
      description: '1 trứng',
      price: 10,
    ),
    MenuItem(
      id: 112,
      restaurantId: 15,
      name: 'Bánh mỳ opla thịt',
      category: 'Bánh mỳ',
      description: '2 trứng',
      price: 15,
    ),
    MenuItem(
      id: 113,
      restaurantId: 15,
      name: 'Bánh mỳ thập cẩm',
      category: 'Bánh mỳ',
      description: 'Gồm opla,chả,thịt nướng',
      price: 20,
    ),
    MenuItem(
      id: 114,
      restaurantId: 15,
      name: 'Combo 1',
      category: 'Bánh mỳ',
      description: 'Gồm 1 bánh mỳ thập cẩm và 1 sữa đậu nành',
      price: 26,
    ),
    MenuItem(
      id: 115,
      restaurantId: 16,
      name: 'Bánh mỳ opla chả',
      category: 'Bánh mỳ',
      description: '1 trứng',
      price: 10,
    ),
    MenuItem(
      id: 116,
      restaurantId: 16,
      name: 'Bánh mỳ opla chả',
      category: 'Bánh mỳ',
      description: '2 trứng',
      price: 15,
    ),
    MenuItem(
      id: 117,
      restaurantId: 16,
      name: 'Bánh mỳ opla thịt',
      category: 'Bánh mỳ',
      description: '1 trứng',
      price: 10,
    ),
    MenuItem(
      id: 118,
      restaurantId: 16,
      name: 'Bánh mỳ opla thịt',
      category: 'Bánh mỳ',
      description: '2 trứng',
      price: 15,
    ),
    MenuItem(
      id: 119,
      restaurantId: 16,
      name: 'Bánh mỳ thập cẩm',
      category: 'Bánh mỳ',
      description: 'Gồm opla,chả,thịt nướng',
      price: 20,
    ),
    MenuItem(
      id: 120,
      restaurantId: 16,
      name: 'Hamburger',
      category: 'Burgers',
      description: 'Gồm bò nướng và trứng',
      price: 30,
    ),
    MenuItem(
      id: 121,
      restaurantId: 17,
      name: 'Bún riêu',
      category: 'Bún',
      description: 'Nhỏ',
      price: 25,
    ),
    MenuItem(
      id: 122,
      restaurantId: 17,
      name: 'Bún riêu',
      category: 'Bún',
      description: 'Lớn',
      price: 35,
    ),
    MenuItem(
      id: 123,
      restaurantId: 17,
      name: 'Bún riêu chả',
      category: 'Bún',
      description: 'Nhỏ',
      price: 30,
    ),
    MenuItem(
      id: 124,
      restaurantId: 17,
      name: 'Bún riêu chả',
      category: 'Bún',
      description: 'Lớn',
      price: 40,
    ),
    MenuItem(
      id: 125,
      restaurantId: 17,
      name: '7 Up',
      category: 'Đồ uống',
      description: 'Kèm theo đá',
      price: 12,
    ),
    MenuItem(
      id: 126,
      restaurantId: 17,
      name: 'Coca',
      category: 'Đồ uống',
      description: 'Kèm theo đá',
      price: 12,
    ),
    MenuItem(
      id: 127,
      restaurantId: 18,
      name: 'Bánh tiêu',
      category: 'Bánh',
      description: '1 cái',
      price: 5,
    ),
    MenuItem(
      id: 128,
      restaurantId: 18,
      name: 'Bánh bò',
      category: 'Bánh',
      description: '1 cái',
      price: 5,
    ),
    MenuItem(
      id: 129,
      restaurantId: 18,
      name: 'Sữa đậu nành',
      category: 'Đồ uống',
      description: 'Nóng',
      price: 10,
    ),
    MenuItem(
      id: 130,
      restaurantId: 18,
      name: 'Sữa đậu nành',
      category: 'Đồ uống',
      description: 'Lạnh',
      price: 10,
    ),
    MenuItem(
      id: 131,
      restaurantId: 18,
      name: 'Sữa đậu xanh',
      category: 'Đồ uống',
      description: 'Nóng',
      price: 10,
    ),
    MenuItem(
      id: 132,
      restaurantId: 18,
      name: 'Sữa đậu xanh',
      category: 'Đồ uống',
      description: 'Lạnh',
      price: 10,
    ),
    MenuItem(
      id: 133,
      restaurantId: 18,
      name: 'Sữa dừa',
      category: 'Đồ uống',
      description: '1 chai',
      price: 10,
    ),
    MenuItem(
      id: 134,
      restaurantId: 18,
      name: 'Milo dầm',
      category: 'Đồ uống',
      description: 'Lạnh',
      price: 10,
    ),
    MenuItem(
      id: 135,
      restaurantId: 19,
      name: 'Ốc hút',
      category: 'Ốc',
      description: 'Phần nhỏ',
      price: 45,
    ),
    MenuItem(
      id: 136,
      restaurantId: 19,
      name: 'Ốc hút',
      category: 'Ốc',
      description: 'Phần lớn',
      price: 60,
    ),
    MenuItem(
      id: 137,
      restaurantId: 19,
      name: 'Ốc bưu hấp xả',
      category: 'Ốc',
      description: 'Phần nhỏ',
      price: 50,
    ),
    MenuItem(
      id: 138,
      restaurantId: 19,
      name: 'Ốc bưu hấp xả',
      category: 'Ốc',
      description: 'Phần lớn',
      price: 60,
    ),
    MenuItem(
      id: 139,
      restaurantId: 19,
      name: 'Ốc cà na',
      category: 'Ốc',
      description: 'Phần nhỏ',
      price: 60,
    ),
    MenuItem(
      id: 140,
      restaurantId: 19,
      name: 'Ốc cà na',
      category: 'Ốc',
      description: 'Phần lớn',
      price: 70,
    ),
    MenuItem(
      id: 141,
      restaurantId: 19,
      name: 'Hàu nướng phô mai',
      category: 'Hàu',
      description: 'Phần nhỏ 3 con',
      price: 50,
    ),
    MenuItem(
      id: 142,
      restaurantId: 19,
      name: 'Hàu nướng phô mai',
      category: 'Hàu',
      description: 'Phần lớn 5 con',
      price: 80,
    ),
    MenuItem(
      id: 143,
      restaurantId: 19,
      name: 'Bia Heineken',
      category: 'Đồ uống',
      description: '1 lon',
      price: 20,
    ),
    MenuItem(
      id: 144,
      restaurantId: 19,
      name: 'Bia Tiger',
      category: 'Đồ uống',
      description: '1 lon',
      price: 20,
    ),
    MenuItem(
      id: 145,
      restaurantId: 20,
      name: 'Mỳ cay hải sản',
      category: 'Mỳ cay',
      description: 'Tôm, cá viên, bò viên',
      price: 35,
    ),
    MenuItem(
      id: 146,
      restaurantId: 20,
      name: 'Mỳ cay bò',
      category: 'Mỳ cay',
      description: 'Thịt bò, cá viên, tôm viên',
      price: 35,
    ),
    MenuItem(
      id: 147,
      restaurantId: 20,
      name: 'Mỳ cay xúc xích',
      category: 'Mỳ cay',
      description: 'Xúc xích, cá viên, bò viên',
      price: 35,
    ),
    MenuItem(
      id: 148,
      restaurantId: 20,
      name: 'Mỳ cay đặc biệt',
      category: 'Mỳ cay',
      description: 'Tôm, thịt bò, cá viên, tôm viên',
      price: 55,
    ),
    MenuItem(
      id: 149,
      restaurantId: 20,
      name: 'Coca',
      category: 'Đồ uống',
      description: '1 lon kèm đá',
      price: 15,
    ),
    MenuItem(
      id: 150,
      restaurantId: 20,
      name: '7 Up',
      category: 'Đồ uống',
      description: '1 lon kèm đá',
      price: 15,
    ),
  ];
}
