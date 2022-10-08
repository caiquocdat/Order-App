import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class DeliveryTime extends Equatable {
  final int id;
  final String value;
  final String time;
  final String? cokingTime;

  DeliveryTime(
      {required this.id,
      required this.value,
      required this.time,
      this.cokingTime});

  @override
  List<Object?> get props => [id, value, time];
  static List<DeliveryTime> deliveryTimes = [
    DeliveryTime(
        id: 1,
        value: '10 phút',
        time: hourAndMinute(DateTime.now().hour, DateTime.now().minute, 10,20),
        cokingTime: '20 phút'),
    DeliveryTime(
        id: 2,
        value: '20 phút',
        time: hourAndMinute(DateTime.now().hour, DateTime.now().minute, 20,20),
        cokingTime: '20 phút'),
    DeliveryTime(
        id: 3,
        value: '30 phút',
        time: hourAndMinute(DateTime.now().hour, DateTime.now().minute, 30,20),
        cokingTime: '20 phút'
    ),
    DeliveryTime(
        id: 4,
        value: '40 phút',
        time: hourAndMinute(DateTime.now().hour, DateTime.now().minute, 40,20),
        cokingTime: '20 phút'
    ),
    DeliveryTime(
        id: 5,
        value: '50 phút',
        time: hourAndMinute(DateTime.now().hour, DateTime.now().minute, 50,20),
        cokingTime: '20 phút'
    ),
    DeliveryTime(
        id: 6,
        value: '60 phút',
        time: hourAndMinute(DateTime.now().hour, DateTime.now().minute, 60,20),
        cokingTime: '20 phút'
    ),
  ];

  static hourAndMinute(int hour, int minute, int increase,int cokingTime) {
    if (minute + increase+cokingTime >= 60 && minute + increase+cokingTime <= 70) {
      return '${hour + 1} giờ 0${minute + increase+cokingTime - 60} phút';
    } else if (minute + increase+cokingTime >= 60 && minute + increase+cokingTime > 69) {
      return '${hour + 1} giờ ${minute + increase+cokingTime - 60} phút';
    }
    return '${hour} giờ ${minute + increase+cokingTime} phút';
  }
}
