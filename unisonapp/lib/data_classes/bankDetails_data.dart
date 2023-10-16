import 'package:flutter/material.dart';

class BankDetailsData extends ChangeNotifier {
  String bank;
  String branch;
  String accountNumber;

  BankDetailsData({
    required this.bank,
    required this.branch,
    required this.accountNumber,
  });

  void setData({
    String? bank,
    String? branch,
    String? accountNumber,
  }) {
    this.bank = bank!;
    this.branch = branch!;
    this.accountNumber = accountNumber!;
    notifyListeners();
  }

  void clearData() {
    this.bank = '';
    this.branch = '';
    this.accountNumber = '';
    notifyListeners();
  }
}

class BankDetailsDataProvider extends ChangeNotifier {
  final BankDetailsData _bankDetailsDataProvider = BankDetailsData(
    bank: '',
    branch: '',
    accountNumber: '',
  );

  BankDetailsData get bankDetailsData => _bankDetailsDataProvider;

  get userData => null;
}
