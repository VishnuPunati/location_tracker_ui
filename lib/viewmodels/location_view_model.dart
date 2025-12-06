import 'package:flutter/material.dart';

class LocationViewModel extends ChangeNotifier {
  String get permissionStatus => 'Granted (mock)';
  bool get isLocationServiceOn => true;

  String get latitude => '17.4401';
  String get longitude => '78.3489';
  String get city => 'Hyderabad';
  String get state => 'Telangana';
  String get pincode => '500032';
  String get lastUpdated => '03 Dec 2025, 10:45 PM (mock)';

  List<Map<String, String>> get history => const [
    {
      'city': 'Hyderabad, Telangana',
      'coords': '17.4401, 78.3489',
      'time': '10:45 PM',
    },
    {
      'city': 'Gachibowli, Hyderabad',
      'coords': '17.4400, 78.3482',
      'time': '10:40 PM',
    },
    {
      'city': 'Madhapur, Hyderabad',
      'coords': '17.4474, 78.3762',
      'time': '10:30 PM',
    },
  ];
}
