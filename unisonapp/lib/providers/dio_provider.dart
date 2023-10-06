import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class DioProvider {
  Future<dynamic> getToken(String email, String password) async {
    try {
      var response = await Dio().post('http://127.0.0.1:8000/api/login',
          data: {"email": email, "password": password});
      if (response.statusCode == 200 && response.data !=null) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('fault in dio provider');
      print(error);
    }
  }

  //get user data
  Future<dynamic> getUser(String token) async {
    try {
      var user = await Dio().get('http://127.0.0.1:8000/api/user',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (user.statusCode == 200) {
        return json.encode(user.data);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> registerUser(
    String firstName,
    String lastName,
    String email,
    String country,
    String birthday,
    String mobileNumber,
    String city,
    String addressLine1,
    String addressLine2,
    String postalCode,
    String provinceState,
    String bank,
    String branch,
    String accountNumber,
    String departmentName,
    String role,
  ) async {
    try {
      final response = await Dio().post(
        'http://127.0.0.1:8000/api/register', // Replace with your registration endpoint
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'country': country,
          'birthday': birthday,
          'mobile_number': mobileNumber,
          'city': city,
          'address_line1': addressLine1,
          'address_line2': addressLine2,
          'postal_code': postalCode,
          'province_state': provinceState,
          'bank': bank,
          'branch': branch,
          'account_number': accountNumber,
          'department_name': departmentName,
          'role': role,
        },
      );

      if (response.statusCode == 200) {
        return json.encode(response.data);
      }
    } catch (error) {
      print(error);
    }
  }
}
