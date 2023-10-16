import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:provider/provider.dart';
import 'package:unisonapp/data_classes/personalDetails_data.dart';
import 'package:unisonapp/utils/validators.dart';
import '../../utils/config.dart';
import '../button.dart';

class PersonalDetailsForm extends StatefulWidget {
  final Function(bool)
      onValidationChanged; // Add the onValidationChanged callback
  final Function(int) changeTabIndex; // Add the changeTabIndex callback

  const PersonalDetailsForm({
    Key? key,
    required this.onValidationChanged,
    required this.changeTabIndex, // Required onValidatarameter
  }) : super(key: key);

  @override
  State<PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _countryController = TextEditingController();
  late PersonalDetailsData personalDetailsData;

  Country? _selectedCountry;

  @override
  void initState() {
    super.initState();
    personalDetailsData =
        Provider.of<PersonalDetailDataProvider>(context, listen: false)
            .personalDetailsData;
  }

  void _openCountryPicker() {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
          _countryController.text = _selectedCountry!.name;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SingleChildScrollView(
      child: Form(
        key: _formKey, // Use the formKey from the widget
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _fnameController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    Validator.validateField('First Name', value),
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'First Name',
                  labelText: 'First Name',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.person_outline),
                  prefixIconColor: Config.secondaryColor,
                ),
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _lnameController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) =>
                    Validator.validateField('Last Name', value),
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                  labelText: 'Last Name',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.person_outline),
                  prefixIconColor: Config.secondaryColor,
                ),
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => Validator.validateField('Email', value),
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Email Address',
                  labelText: 'Email Address',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.email_outlined),
                  prefixIconColor: Config.secondaryColor,
                ),
              ),
              Config.spaceSmall,
              Row(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 12.5),
                        child: Row(
                          children: [
                            const Icon(Icons.blur_circular,
                                color: Config.secondaryColor),
                            const SizedBox(width: 10),
                            Text(
                              _selectedCountry?.name ?? 'No country selected',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black38,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _openCountryPicker();
                              },
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) =>
                    Validator.validateField('Phone Number', value),
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.email_outlined),
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
                    personalDetailsData.setData(
                      firstName: _fnameController.text,
                      lastName: _lnameController.text,
                      email: _emailController.text,
                      country: _countryController.text,
                      mobileNumber: _phoneController.text,
                    );
                    // widget.onValidationChanged(true);
                    widget.changeTabIndex(1);
                    print(personalDetailsData.firstName);
                    print(personalDetailsData.lastName);
                    print(personalDetailsData.email);
                    print(personalDetailsData.country);
                    print(personalDetailsData.mobileNumber);

                  } else {
                    // widget.onValidationChanged(false);
                  }
                },
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
