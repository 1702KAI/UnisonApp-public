import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unisonapp/utils/validators.dart';
import '../../data_classes/bankDetails_data.dart';
import '../../utils/config.dart';
import '../button.dart';

class BankingDetailsForm extends StatefulWidget {
  final Function(bool)
      onValidationChanged; // Add the onValidationChanged callback
  final Function(int) changeTabIndex; // Add the changeTabIndex callback

  const BankingDetailsForm({
    Key? key,
    required this.onValidationChanged,
    required this.changeTabIndex, // Required onValidatarameter
  }) : super(key: key);

  @override
  State<BankingDetailsForm> createState() => _BankingDetailsFormState();
}

class _BankingDetailsFormState extends State<BankingDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final _bankNameController = TextEditingController();
  final _branchNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  late BankDetailsData bankingDetailsData;

  @override
  void initState() {
    super.initState();
    bankingDetailsData =
        Provider.of<BankDetailsDataProvider>(context, listen: false)
            .bankDetailsData;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _bankNameController,
                validator: (value) => Validator.validateField('Bank', value),
                keyboardType: TextInputType.emailAddress,
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    hintText: 'Bank',
                    labelText: 'Bank',
                    labelStyle: TextStyle(color: Colors.black38),
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.attach_money_outlined),
                    prefixIconColor: Config.secondaryColor),
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _branchNameController,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Branch',
                  labelText: 'Branch',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.attach_money_outlined),
                  prefixIconColor: Config.secondaryColor,
                ),
              ),
              Config.spaceSmall,
              TextFormField(
                controller: _accountNumberController,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Account Number',
                  labelText: 'Account Number',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.person_outline),
                  prefixIconColor: Config.secondaryColor,
                ),
              ),
              Config.spaceSmall,
              Button(
                width: double.infinity,
                title: 'Confirm and Continue',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bankingDetailsData.bank = _bankNameController.text;
                    bankingDetailsData.branch = _branchNameController.text;
                    bankingDetailsData.accountNumber =
                        _accountNumberController.text;
                    Navigator.pushNamed(context, 'departmentPage');
                  } else {
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
