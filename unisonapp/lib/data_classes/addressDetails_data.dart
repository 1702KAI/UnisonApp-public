import 'package:flutter/material.dart';


class AddressDetailsData extends ChangeNotifier{
  String city;
  String addressLine1;
  String addressLine2;
  String postalCode;
  String provinceState;

  AddressDetailsData({
    required this.city,
    required this.addressLine1,
    required this.addressLine2,
    required this.postalCode,
    required this.provinceState,
  });

  void setData({
    String? city,
    String? addressLine1,
    String? addressLine2,
    String? postalCode,
    String? provinceState,
  }) {
    this.city = city!;
    this.addressLine1 = addressLine1!;
    this.addressLine2 = addressLine2!;
    this.postalCode = postalCode!;
    this.provinceState = provinceState!;
    notifyListeners();
  }

  void clearData() {
    this.city = '';
    this.addressLine1 = '';
    this.addressLine2 = '';
    this.postalCode = '';
    this.provinceState = '';
    notifyListeners();
  }
  
}


class AddressDetailsDataProvider extends ChangeNotifier{
  final AddressDetailsData _addressDetailsDataProvider = AddressDetailsData(
    city: '',
    addressLine1: '',
    addressLine2: '',
    postalCode: '',
    provinceState: '',
  );

  AddressDetailsData get addressDetailsData => _addressDetailsDataProvider;

  get userData => null;
}