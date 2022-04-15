import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lightbook_flutter/homepage/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lightbook_flutter/resources/auth_methods.dart';
import 'package:lightbook_flutter/widgets/text_field_input.dart';
import 'package:image_picker/image_picker.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool _value = false;

  var prefs;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _nameController.dispose();
  }

  late FToast fToast;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF2C2C2C),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFieldInput(
                            textEditingController: _nameController,
                            hintText: 'Mời nhập tên',
                            textInputType: TextInputType.text,
                            icon: Icons.perm_contact_cal,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFieldInput(
                            textEditingController: _emailController,
                            hintText: 'Mời nhập Email',
                            textInputType: TextInputType.text,
                            icon: Icons.phone,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFieldInput(
                            textEditingController: _passwordController,
                            hintText: 'Mời nhập mật khẩu',
                            textInputType: TextInputType.text,
                            icon: Icons.lock,
                            isPass: true,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFieldInput(
                            textEditingController: _passwordController,
                            hintText: 'Mời nhập lại mật khẩu',
                            textInputType: TextInputType.text,
                            icon: Icons.lock,
                            isPass: true,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              // child: ElevatedButton(
                              //   onPressed: () async {
                              //     if (_value) {
                              //       // obtain shared preferences
                              //       prefs.setString(
                              //           'telephone', _emailController.text);
                              //       prefs.setString(
                              //           'password', _passwordController.text);
                              //       prefs.setBool('check', _value);
                              //     } else {
                              //       prefs.remove('check');
                              //     }

                              //     Navigator.pushNamed(
                              //         context, HomePage.routeName);
                              //   },
                              //   style: ButtonStyle(
                              //       backgroundColor:
                              //           MaterialStateProperty.all<Color>(
                              //               Color(0xFF353535)),
                              //       shape: MaterialStateProperty.all<
                              //               RoundedRectangleBorder>(
                              //           RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(10.0),
                              //       ))),
                              //   child: Text(
                              //     "Đăng ký",
                              //     style: TextStyle(
                              //         fontSize: 18, color: Colors.white),
                              //   ),
                              // ),
                              child: InkWell(
                                onTap: () => AuthMethods().signUpUser(
                                    email: email,
                                    password: password,
                                    username: username,
                                    name: name),
                                child: Container(
                                  child: const Text('Đăng ký'),
                                ),
                              )),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
