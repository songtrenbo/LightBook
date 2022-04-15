import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lightbook_flutter/homepage/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lightbook_flutter/resources/auth_methods.dart';
import 'package:lightbook_flutter/signup/signuppage.dart';
import 'package:lightbook_flutter/widgets/text_field_input.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/utils.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool _value = false;

  var prefs;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() async {
    //set loading to true
    setState(() {
      _isLoading = true;
    });
    // signup user using auth method
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
        name: _nameController.text);

    // if string returned is sucess, user has been created
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return SignUpPage()
          }
        ),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      showSnackBar(context, res);
    }
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
                            icon: Icons.email,
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
                            textEditingController: _confirmPasswordController,
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
                              child: InkWell(
                                onTap: signUpUser,
                                child: Container(
                                  child: !_isLoading
                                      ? const Text(
                                          'Đăng ký',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        )
                                      : const CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  decoration: const ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      color: Color(0xFF353535)),
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
