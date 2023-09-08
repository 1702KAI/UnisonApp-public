import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import '../utils/config.dart';
import 'button.dart';

class PersonalDetailsForm extends StatefulWidget {
  const PersonalDetailsForm({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {

  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  bool obescurePass = true;
  Country? _selectedCountry;

  void _openCountryPicker() {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _fnameController,
                keyboardType: TextInputType.emailAddress,
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
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                obscureText: obescurePass,
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
                onPressed: () {},
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