import 'package:flutter/material.dart';

class DepartmentDetailsData extends ChangeNotifier{
  String departmentName;
  String role;

  DepartmentDetailsData({
    required this.departmentName,
    required this.role,
  });

  void setData({
    String? departmentName,
    String? role,
  }) {
    this.departmentName = departmentName!;
    this.role = role!;
    notifyListeners();
  }

  void clearData() {
    this.departmentName = '';
    this.role = '';
    notifyListeners();
  }
  
}

class DepartmentDetialsDataProvider extends ChangeNotifier{
  final DepartmentDetailsData _departmentDetailsDataProvider = DepartmentDetailsData(
    departmentName: '',
    role: '',
  );

  DepartmentDetailsData get departmentDetailsData => _departmentDetailsDataProvider;

  get userData => null;
}