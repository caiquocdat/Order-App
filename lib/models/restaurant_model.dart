import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'category_model.dart';
import 'opening_hours_model.dart';
import 'place_model.dart';
import 'product_model.dart';

import 'menu_item_model.dart';

class Restaurant extends Equatable {
  final int id;
  final String name;
  final String imageUrl;

  // final String description;
  final List<String> tags;
  final List<MenuItem> menuItems;

  // final List<Category> categories;
  // final List<Product> products;
  // final List<OpeningHours> openingHours;
  final int deliveryTime;

  final String priceCategory;
  final double deliveryFee;
  final double distance;
  final String address;

  // final Place address;

  const Restaurant({
    required this.id,
    required this.name,
    // required this.description,
    required this.imageUrl,
    required this.tags,
    required this.menuItems,
    // required this.categories,
    // required this.products,
    // required this.openingHours,
    // required this.address,
    required this.deliveryTime,
    required this.priceCategory,
    required this.deliveryFee,
    required this.distance,
    required this.address
  });

  // factory Restaurant.fromSnapshot(DocumentSnapshot snap) {
  //   return Restaurant(
  //     id: snap.id,
  //     name: snap['name'],
  //     imageUrl: snap['imageUrl'],
  //     description: snap['description'],
  //     tags: (snap['tags'] as List).map(
  //       (tag) {
  //         return tag as String;
  //       },
  //     ).toList(),
  //     categories: (snap['categories'] as List).map(
  //       (category) {
  //         return Category.fromSnapshot(category);
  //       },
  //     ).toList(),
  //     products: (snap['products'] as List).map(
  //       (product) {
  //         return Product.fromSnapshot(product);
  //       },
  //     ).toList(),
  //     openingHours: (snap['openingHours'] as List).map(
  //       (openingHour) {
  //         return OpeningHours.fromSnapshot(openingHour);
  //       },
  //     ).toList(),
  //     address: Place.fromJson(snap['address']),
  //   );
  // }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      // description,
      imageUrl,
      tags,
      menuItems,
      // categories,
      // products,
      // openingHours,
      deliveryTime,
      priceCategory,
      deliveryFee,
      distance,
      address,
    ];
  }

  static List<Restaurant> restaurants = [
    Restaurant(
        id: 1,
        name: 'Cơm tấm Lộc Thọ',
        imageUrl:
            'https://quangcaonhat.com/wp-content/uploads/2021/03/Mau-bang-hieu-quan-com-3.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 1)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 1)
            .toList(),
        deliveryTime: 30,
        deliveryFee: 30,
        priceCategory: '\30k',
        distance: 0.1,
        address: '02 Thanh Sơn,Thanh Bình,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 2,
        name: 'Jollibee',
        imageUrl:
            'https://gigamall.com.vn/data/2019/05/06/09314542_logo-jollibee-500x500.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 2)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 2)
            .toList(),
        deliveryTime: 25,
        deliveryFee: 50,
        priceCategory: '\50k',
        distance: 0.1,
        address: '30 Thanh Thủy,Thanh Bình,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 3,
        name: 'Trà sữa Phúc Long',
        imageUrl: 'https://blog.dktcdn.net/files/nhuong-quyen-phuc-long-3.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 3)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 3)
            .toList(),
        deliveryTime: 30,
        deliveryFee: 35,
        priceCategory: '\30k',
        distance: 0.1,
        address: '30 Ông Ích Khiêm,Thanh Bình,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 4,
        name: 'Bún chả cá bà Lữ',
        imageUrl:
            'https://dulichsontra.com/wp-content/uploads/2022/09/ba-lu.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 4)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 4)
            .toList(),
        deliveryTime: 15,
        deliveryFee: 25,
        priceCategory: '\20k',
        distance: 0.1,
        address: '245 Đống Đa,Thuận Phước,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 5,
        name: 'Trà sữa Ezi',
        imageUrl:
            'https://gauoi.vn/wp-content/uploads/2021/ezi/gauoi-ezicoffee-4.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 5)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 5)
            .toList(),
        deliveryTime: 25,
        deliveryFee: 30,
        priceCategory: '\30k',
        distance: 0.1,
        address: '345 Đống Đa,Thuận Phước,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 6,
        name: 'Bánh canh Vân',
        imageUrl:
            'https://images.foody.vn/res/g1/7862/prof/s576x330/foody-mobile-foody-banh-canh-van--754-635901813993576660.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 6)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 6)
            .toList(),
        deliveryTime: 20,
        deliveryFee: 30,
        priceCategory: '\20k',
        distance: 0.1,
        address: '300 Đống Đa,Thuận Phước,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 7,
        name: 'Bún đậu mắm tôm Cuội',
        imageUrl:
            'https://sp-ao.shortpixel.ai/client/to_webp,q_glossy,ret_img,w_1080,h_1350/https://gauoi.vn/wp-content/uploads/2020/10/trungbuii_96259079_108678704041402_6621257791065724240_n.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 7)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 7)
            .toList(),
        deliveryTime: 30,
        deliveryFee: 35,
        priceCategory: '\50k',
        distance: 0.1,
        address: '215 Đống Đa,Thuận Phước,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 8,
        name: 'Bún đậu mắm tôm Gánh',
        imageUrl:
            'https://bundau383970142.files.wordpress.com/2018/07/banner-3.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 8)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 8)
            .toList(),
        deliveryTime: 25,
        deliveryFee: 30,
        priceCategory: '\50k',
        distance: 0.1,
        address: '125 Ông Ích Khiêm,Thanh Bình,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 9,
        name: 'Bánh cuốn Lan',
        imageUrl:
            'https://toplist.vn/images/800px/banh-cuon-nong-lan-332699.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 9)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 9)
            .toList(),
        deliveryTime: 15,
        deliveryFee: 20,
        priceCategory: '\20k',
        distance: 0.1,
        address: '50 Đống Đa,Thuận Phước,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 10,
        name: 'Chè Liên',
        imageUrl:
            'https://toplist.vn/images/800px/che-sau-rieng-xuan-trang-276947.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 10)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 10)
            .toList(),
        deliveryTime: 10,
        deliveryFee: 20,
        priceCategory: '\20k',
        distance: 0.1,
        address: '195 Hải Phòng,Tân Chính,Thanh Khê,Đà Nẵng'
    ),
    Restaurant(
        id: 11,
        name: 'Trà sữa HouseOfCha',
        imageUrl:
            'https://top10vietnam.vn/wp-content/uploads/2020/07/cua-hang-tra-sua-house-of-cha.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 11)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 11)
            .toList(),
        deliveryTime: 30,
        deliveryFee: 35,
        priceCategory: '\30k',
        distance: 0.1,
        address: '295 Hải Phòng,Tân Chính,Thanh Khê,Đà Nẵng'
    ),
    Restaurant(
        id: 12,
        name: 'Chè Xuân Trang',
        imageUrl:
            'https://sites.google.com/site/quanchexuantrangleduandanang/_/rsrc/1474896667146/home/14324222_1843050682591901_2221807577296915761_o%20%281%29.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 12)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 12)
            .toList(),
        deliveryTime: 15,
        deliveryFee: 15,
        priceCategory: '\20k',
        distance: 0.1,
        address: '335 Hải Phòng,Tân Chính,Thanh Khê,Đà Nẵng'
    ),
    Restaurant(
        id: 13,
        name: 'Mỳ cay 7 cấp độ',
        imageUrl:
            'https://cdn.daynauan.info.vn/wp-content/uploads/2018/06/mi-cay-han-quoc.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 13)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 13)
            .toList(),
        deliveryTime: 30,
        deliveryFee: 35,
        priceCategory: '\30k',
        distance: 0.1,
        address: '195 Lê Duẫn,Tân Chính,Thanh Khê,Đà Nẵng'
    ),
    Restaurant(
        id: 14,
        name: 'Cơm chiên A Hải',
        imageUrl:
            'https://nauantainha.com/wp-content/uploads/cooked/images/recipes/recipe_1501.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 14)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 14)
            .toList(),
        deliveryTime: 20,
        deliveryFee: 50,
        priceCategory: '\30k',
        distance: 0.1,
        address: '5 Hải Châu,Hải Châu 1,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 15,
        name: 'Bánh mì Lan',
        imageUrl:
            'https://images.foody.vn/res/g1/9670/s800/foody-ba-lan-banh-mi-thit-cha-932-637392456563668895.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 15)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 15)
            .toList(),
        deliveryTime: 15,
        deliveryFee: 15,
        priceCategory: '\20k',
        distance: 0.1,
        address: '15 Lê Duẫn,Hải Châu 1,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 16,
        name: 'Bánh mì Đồng Tiến',
        imageUrl:
            'http://dongtienbakery.com/image/data/Tin%20t%E1%BB%A9c/2016_0302_06334200(1).jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 16)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 16)
            .toList(),
        deliveryTime: 15,
        deliveryFee: 20,
        priceCategory: '\20k',
        distance: 0.1,
        address: '105 Quang Trung,Thạch Thang,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 17,
        name: 'Bún riêu bà Ân',
        imageUrl:
            'https://images.foody.vn/res/g8/70658/s800/foody-bun-cha-ca-ca-thu-ba-an-221-637139460787061484.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 17)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 17)
            .toList(),
        deliveryTime: 20,
        deliveryFee: 25,
        priceCategory: '\20k',
        distance: 0.1,
        address: '95 Quang Trung,Thạch Thang,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 18,
        name: 'Sữa đậu nành Hẻm',
        imageUrl:
            'https://kenh14cdn.com/2018/12/11/sua2-15444846899551246503049.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 18)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 18)
            .toList(),
        deliveryTime: 15,
        deliveryFee: 20,
        priceCategory: '\20k',
        distance: 0.1,
        address: '100 Quang Trung,Thạch Thang,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 19,
        name: 'Ốc hút Quyên',
        imageUrl:
            'https://monngondathanh.com/wp-content/uploads/2017/07/c%C3%A1c-qu%C3%A1n-%E1%BB%91c-h%C3%BAt-ngon-%E1%BB%9F-%C4%90%C3%A0-N%E1%BA%B5ng.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 19)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 19)
            .toList(),
        deliveryTime: 30,
        deliveryFee: 45,
        priceCategory: '\50k',
        distance: 0.1,
        address: '99 Nguyễn Thị Minh Khai,Thạch Thang,Hải Châu,Đà Nẵng'
    ),
    Restaurant(
        id: 20,
        name: 'Mỳ trộn cay Hàn Quốc',
        imageUrl:
            'https://yeubepnghiennha.vn/wp-content/uploads/2020/08/mi-cay-6.jpg',
        tags: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 20)
            .map((menuItems) => menuItems.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItems) => menuItems.restaurantId == 20)
            .toList(),
        deliveryTime: 25,
        deliveryFee: 35,
        priceCategory: '\30k',
        distance: 0.1,
        address: '10 Nguyễn Thị Minh Khai,Thạch Thang,Hải Châu,Đà Nẵng'
    ),
  ];
}
