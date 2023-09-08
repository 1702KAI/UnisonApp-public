import 'package:flutter/material.dart';

import '../utils/config.dart';
import 'button.dart';

class BankingDetailsForm extends StatefulWidget {
  const BankingDetailsForm({Key? key}) : super(key: key);

  @override
  State<BankingDetailsForm> createState() => _BankingDetailsFormState();
}

class _BankingDetailsFormState extends State<BankingDetailsForm>{
  final _formKey = GlobalKey<FormState>();
  final _bankNameController = TextEditingController();
  final _branchNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  
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
                keyboardType: TextInputType.emailAddress,
                cursorColor: Config.secondaryColor,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Bank',
                  labelText: 'Bank',
                  labelStyle: TextStyle(color: Colors.black38),
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.attach_money_outlined),
                  prefixIconColor: Config.secondaryColor
                ),
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