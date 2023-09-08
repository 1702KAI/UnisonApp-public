import 'package:flutter/material.dart';

class PersonalDetailsData extends ChangeNotifier {
  String firstName;
  String lastName;
  String email;
  String country;
  String birthday;
  String mobileNumber;

  PersonalDetailsData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.country,
    required this.birthday,
    required this.mobileNumber,
  });

  void setData({
    String? firstName,
    String? lastName,
    String? email,
    String? country,
    String? birthday,
    String? mobileNumber,
  }) {
    this.firstName = firstName!;
    this.lastName = lastName!;
    this.email = email!;
    this.country = country!;
    this.birthday = birthday!;
    this.mobileNumber = mobileNumber!;
    notifyListeners();
  }

  void clearData() {
    this.firstName = '';
    this.lastName = '';
    this.email = '';
    this.country = '';
    this.birthday = '';
    this.mobileNumber = '';
    notifyListeners();
  }
}

class PersonalDetailDataProvider extends ChangeNotifier {
  final PersonalDetailsData _personalDetailDataProvider = PersonalDetailsData(
    firstName: '',
    lastName: '',
    email: '',
    country: '',
    birthday: '',
    mobileNumber: '',

      );

  PersonalDetailsData get personalDetailsData => _personalDetailDataProvider;

  get userData => null;
}
