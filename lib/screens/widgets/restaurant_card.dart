import 'package:flutter/material.dart';


import '../../models/restaurant_model.dart';
import 'restaurant_tags.dart';

import 'widgets.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screen =  MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/restaurant-details',
          arguments: restaurant,
        );
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                      image: NetworkImage(restaurant.imageUrl),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 60,
                  height: 30,
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${restaurant.deliveryTime} phút',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurant.name,
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: 5),
                    RestaurantTags(restaurant: restaurant),
                    SizedBox(height: 5),
                    // Positioned(
                    //   right: 10,
                    //   top: 10,
                    //   child: Text('1'),
                    // ),

                    // Positioned(
                    //   top: 10,right: 100,
                    //   child: Container(
                    //     padding: EdgeInsets.all(5),
                    //     decoration: BoxDecoration(
                    //         color: Colors.black45,
                    //         borderRadius: BorderRadius.circular(10),
                    //         border: Border.all(color: Colors.white,width: 2)
                    //     ),
                    //     child: Row(
                    //       children: <Widget>[
                    //         Icon(Icons.timer,color:Colors.white,size: 25),
                    //         Text('1',
                    //             style:TextStyle(fontSize: 22,color: Colors.white)
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Container(
                               width: _screen.width * 0.45,
                               child: Text('Khoảng cách: ${restaurant.distance} Km')
                           ),
                           VerticalDivider(width: 0),
                           Container(
                               width: _screen.width * 0.5,
                               child: Text('Miễn phí giao hàng từ: ${restaurant.deliveryFee}K VND',textAlign: TextAlign.right,)
                           ),
                         ]
                        ),

                   

                    // Text(
                    //
                    //   'Khoảng cách: ${restaurant.distance} - Giá món trung bình: ${restaurant.deliveryFee} VND',
                    //
                    //   style: Theme.of(context).textTheme.bodyText1,
                    // ),
                    SizedBox(height: 5),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
