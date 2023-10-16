import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unisonapp/data_classes/addressDetails_data.dart';
import 'package:unisonapp/data_classes/bankDetails_data.dart';
import 'package:unisonapp/data_classes/departmentDetails_data.dart';
import 'package:unisonapp/data_classes/personalDetails_data.dart';
import '../../providers/dio_provider.dart';
import '../../utils/config.dart';
import '../button.dart';

class DepartmentDetailsForm extends StatefulWidget {
  const DepartmentDetailsForm({Key? key}) : super(key: key);

  @override
  State<DepartmentDetailsForm> createState() => _DepartmentDetailsFormState();
}

class _DepartmentDetailsFormState extends State<DepartmentDetailsForm> {
  String? _selectedDepartment; // Store the selected department as a String
  final _roleController = TextEditingController();
  late PersonalDetailsData
      personalDetailsData; // Create a new instance of PersonalDetailsData
  late AddressDetailsData
      addressDetailsData; // Create a new instance of AddressDetailsData
  late BankDetailsData
      bankDetailsData; // Create a new instance of BankDetailsData
  late DepartmentDetailsData
      departmentDetailsData; // Create a new instance of DepartmentDetailsData
  Map<String, dynamic> registrationData = {
    'first_name': 'John',
    'last_name': 'Doe',
    'email': 'johndoe@example.com',
    'country': 'United States',
    'birthday': '1990-05-15',
    'mobile_number': '1234567890',
    'city': 'New York',
    'address_line1': '123 Main St',
    'address_line2': 'Apt 4B',
    'postal_code': '10001',
    'province_state': 'NY',
    'bank': 'Sample Bank',
    'branch': 'Downtown Branch',
    'account_number': '1234567890',
    'department_name': 'Finance',
    'role': 'Accountant',
    'password': 'your_password_here',
  };

  @override
  void initState() {
    super.initState();
    personalDetailsData =
        Provider.of<PersonalDetailDataProvider>(context, listen: false)
            .personalDetailsData;
    addressDetailsData =
        Provider.of<AddressDetailsDataProvider>(context, listen: false)
            .addressDetailsData;
    bankDetailsData =
        Provider.of<BankDetailsDataProvider>(context, listen: false)
            .bankDetailsData;
    departmentDetailsData =
        Provider.of<DepartmentDetailsDataProvider>(context, listen: false)
            .departmentDetailsData;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key:
            GlobalKey<FormState>(), // Use GlobalKey<FormState> for the form key
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Config.spaceSmall,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Select your department',
                  style: TextStyle(
                    fontFamily: 'helveticaFont',
                    color: Config.secondaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Config.spaceSmall,
              DropdownButtonFormField<String>(
                value: _selectedDepartment,
                decoration: const InputDecoration(
                  labelText: 'Select your department',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.business), // You can change the icon
                  prefixIconColor: Config.secondaryColor,
                ),
                items: [
                  'Finance',
                  'HR',
                  'Marketing',
                  'Operation',
                  'Sales',
                  'Development',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDepartment = newValue;
                    departmentDetailsData.departmentName = _selectedDepartment!;
                  });
                },
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _roleController,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Enter your role',
                  labelText: 'Enter your role',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.lock_outline),
                  prefixIconColor: Config.secondaryColor,
                ),
              ),
              Config.spaceSmall,
              Button(
                width: double.infinity,
                title: 'Request Account',
                onPressed: () {
                  createUserRequest();
                  if (_selectedDepartment != null &&
                      _roleController.text.isNotEmpty) {
                    // createUserRequest();
                    departmentDetailsData.setData(
                      departmentName: _selectedDepartment!,
                      role: _roleController.text,
                    );
                    // createUserRequest();
                    Navigator.pushNamed(context, 'registrationSuccess');
                  }
                },
                disable: false,
                textColor: Config.secondaryColor,
              ),
              Button(
                width: double.infinity,
                title: 'Cancel',
                onPressed: () {},
                disable: false,
                textColor: Config.secondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<void> createUserRequest() async {
  //   await DioProvider().registerUser(
  //       personalDetailsData.firstName,
  //       personalDetailsData.lastName,
  //       personalDetailsData.email,
  //       personalDetailsData.country,
  //       '12/12/2000', // Use the selected date
  //       personalDetailsData.mobileNumber,
  //       addressDetailsData.city,
  //       addressDetailsData.addressLine1,
  //       addressDetailsData.addressLine2,
  //       addressDetailsData.postalCode,
  //       addressDetailsData.provinceState,
  //       bankDetailsData.bank,
  //       bankDetailsData.branch,
  //       bankDetailsData.accountNumber,
  //       departmentDetailsData.departmentName,
  //       departmentDetailsData.role, // Use the selected department
  //     );
  // }

  Future<void> createUserRequest() async {
    await DioProvider().registerUser(
      registrationData['first_name'],
      registrationData['last_name'],
      registrationData['email'],
      registrationData['country'],
      registrationData['birthday'], // Use the selected date
      registrationData['mobile_number'],
      registrationData['city'],
      registrationData['address_line1'],
      registrationData['address_line2'],
      registrationData['postal_code'],
      registrationData['province_state'],
      registrationData['bank'],
      registrationData['branch'],
      registrationData['account_number'],
      registrationData['department_name'],
      registrationData['role'], // Use the selected department
    );
  }

  // Future<void> makePostRequest() async {
  //   final dio = Dio();

  //   try {
  //     final response = await dio.post(
  //       'http://127.0.0.1:8000/api/register', // Replace with your registration endpoint
  //       data: {
  //         registrationData['first_name'],
  //         registrationData['last_name'],
  //         registrationData['email'],
  //         registrationData['country'],
  //         registrationData['birthday'], // Use the selected date
  //         registrationData['mobile_number'],
  //         registrationData['city'],
  //         registrationData['address_line1'],
  //         registrationData['address_line2'],
  //         registrationData['postal_code'],
  //         registrationData['province_state'],
  //         registrationData['bank'],
  //         registrationData['branch'],
  //         registrationData['account_number'],
  //         registrationData['department_name'],
  //         registrationData['role'], // Use the selected department
  //         // registrationData['password'], // Include the password
  //       },
  //       options: Options(
  //         followRedirects: false, // Disable automatic redirection handling
  //       ),
  //     );

  //     if (response.statusCode == 302) {
  //       // The server returned a redirection status code (302)
  //       // You can access the redirection URL from the 'location' header
  //       final redirectionUrl = response.headers['location']?.first;

  //       if (redirectionUrl != null) {
  //         // Follow the redirection manually
  //         final redirectionResponse = await dio.get(
  //           redirectionUrl,
  //           options: Options(
  //             followRedirects: false, // Disable automatic redirection handling
  //           ),
  //         );

  //         // Now 'redirectionResponse' contains the response after following the redirection
  //         // You can handle it as needed
  //       }
  //     } else {
  //       // Handle the response as usual
  //       if (response.statusCode == 200) {
  //         // Registration was successful
  //         print('Registration successful');
  //         // Handle the response data
  //       } else {
  //         // Registration failed
  //         print('Registration failed with status code: ${response.statusCode}');
  //         // Handle the failure response
  //       }
  //     }
  //   } catch (e) {
  //     // Handle Dio errors
  //     print('Dio error: $e');
  //   }
  // }
}
