import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unisonapp/data_classes/addressDetails_data.dart';

import '../../utils/config.dart';
import '../button.dart';

class AddressDetailsForm extends StatefulWidget {
   final Function(bool) onValidationChanged; // Add the onValidationChanged callback
  final Function(int) changeTabIndex; // Add the changeTabIndex callback

  const AddressDetailsForm({
    Key? key,
    required this.onValidationChanged,
    required this.changeTabIndex, // Required onValidatarameter
  }) : super(key: key);

  @override
  State<AddressDetailsForm> createState() => _AddressDetailsFormState();
}

class _AddressDetailsFormState extends State<AddressDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final _cityNameController = TextEditingController();
  final _address1Controller = TextEditingController();
  final _address2Controller = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _provinceController = TextEditingController();
  late AddressDetailsData addressDetailsData;

  @override
  void initState() {
    super.initState();
    addressDetailsData =
        Provider.of<AddressDetailsDataProvider>(context, listen: false)
            .addressDetailsData;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _cityNameController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'City',
                  labelText: 'City',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.location_city_outlined),
                  prefixIconColor: Config.secondaryColor,
                ),
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _address1Controller,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Address Line 1',
                  labelText: 'Address Line 1',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.house_outlined),
                  prefixIconColor: Config.secondaryColor,
                ),
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _address2Controller,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Address Line 2',
                  labelText: 'Address Line 2',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.house_outlined),
                  prefixIconColor: Config.secondaryColor,
                ),
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _postalCodeController,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Postal code',
                  labelText: 'Postal code',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.pin_drop_outlined),
                  prefixIconColor: Config.secondaryColor,
                ),
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _provinceController,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Province/State',
                  labelText: 'Province/State',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.location_city_outlined),
                  prefixIconColor: Config.secondaryColor,
                ),
              ),
              // Login button
              Config.spaceSmall,
              Button(
                width: double.infinity,
                title: 'Confirm and Continue',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    addressDetailsData.setData(
                      city: _cityNameController.text,
                      addressLine1: _address1Controller.text,
                      addressLine2: _address2Controller.text,
                      postalCode: _postalCodeController.text,
                      provinceState: _provinceController.text,
                    );
                    widget.onValidationChanged(true);
                    widget.changeTabIndex(2);
                    print(addressDetailsData.city);
                    print(addressDetailsData.addressLine2);
                    print(addressDetailsData.addressLine1);
                  } else {
                    widget.onValidationChanged(false);
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
}
