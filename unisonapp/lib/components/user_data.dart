import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  String firstName;
  String lastName;
  String email;
  String country;
  DateTime birthday;
  String mobileNumber;
  String city;
  String addressLine1;
  String addressLine2;
  String postalCode;
  String provinceState;
  String bank;
  String branch;
  String accountNumber;
  String departmentName;
  String role;

  UserData({
    required this.firstName,
    required this.lastName ,
    required this.email ,
    required this.country ,
    required this.birthday,
    required this.mobileNumber,
    required this.city,
    required this.addressLine1,
    required this.addressLine2 ,
    required this.postalCode ,
    required this.provinceState ,
    required this.bank ,
    required this.branch,
    required this.accountNumber ,
    required this.departmentName,
    required this.role ,
  });

  void setData({
    String? firstName,
    String? lastName,
    String? email,
    String? country,
    DateTime? birthday,
    String? mobileNumber,
    String? city,
    String? addressLine1,
    String? addressLine2,
    String? postalCode,
    String? provinceState,
    String? bank,
    String? branch,
    String? accountNumber,
    String? departmentName,
    String? role,
  }) {
    this.firstName = firstName!;
    this.lastName = lastName!;
    this.email = email!;
    this.country = country!;
    this.birthday = birthday!;
    this.mobileNumber = mobileNumber!;
    this.city = city!;
    this.addressLine1 = addressLine1!;
    this.addressLine2 = addressLine2!;
    this.postalCode = postalCode!;
    this.provinceState = provinceState!;
    this.bank = bank!;
    this.branch = branch!;
    this.accountNumber = accountNumber!;
    this.departmentName = departmentName!;
    this.role = role!;
    
    notifyListeners();
  }
}

class UserDataProvider extends ChangeNotifier{
  final UserData userData = UserData(
    firstName: '',
    lastName: '',
    email: '',
    country: '',
    birthday: DateTime.now(),
    mobileNumber: '',
    city: '',
    addressLine1: '',
    addressLine2: '',
    postalCode: '',
    provinceState: '',
    bank: '',
    branch: '',
    accountNumber: '',
    departmentName: '',
    role: '',

  );
  
}
