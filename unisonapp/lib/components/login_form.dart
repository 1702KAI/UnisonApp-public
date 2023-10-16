import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unisonapp/main.dart';
import 'package:unisonapp/models/authModel.dart';
// import 'package:unisonapp/providers/dio_provider.dart';
import '../providers/dio_provider.dart';
import '../utils/config.dart';
import 'button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obescurePass = true;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.secondaryColor,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
                hintText: 'Email Address',
                labelText: 'Email Address',
                labelStyle: TextStyle(color: Colors.black38),
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.email_outlined),
                prefixIconColor: Config.secondaryColor),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.secondaryColor,
            style: const TextStyle(color: Colors.black),
            obscureText: obescurePass,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.black38),
                alignLabelWithHint: true,
                prefixIcon: const Icon(Icons.lock_outline),
                prefixIconColor: Config.secondaryColor,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obescurePass = !obescurePass;
                      });
                    },
                    icon: obescurePass
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.black38,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: Config.secondaryColor,
                          ))),
          ),
          Config.spaceSmall,
          //login button
          Consumer<AuthModel>(
            builder: (context, auth, child) => Container(
              child: Button(
                width: double.infinity,
                title: 'Sign In',
                onPressed: () async {
                  print(_emailController.text);
                  print(_passController.text);
                  final token = await DioProvider()
                      .getToken(_emailController.text, _passController.text);
                  if (token != null) {
                    // Token retrieval was successful
                    auth.loginSuccess();
                    print(token);
                    MyApp.navigatorKey.currentState!.pushNamed('main');
                  } else {
                    // Handle the case where token retrieval failed
                    print('Token retrieval failed');
                  }
                },
                disable: false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
