import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lightbook_flutter/homepage/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lightbook_flutter/signup/components/signupform.dart';
import 'package:lightbook_flutter/widgets/text_field_input.dart';

import '../../resources/auth_methods.dart';
import '../../utils/utils.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _value = false;

  var prefs;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return HomePage();
        }),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
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
                          SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: InkWell(
                                onTap: loginUser,
                                child: Container(
                                  child: !_isLoading
                                      ? const Text(
                                          'Đăng Nhập',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: const Text(
                                  'Dont have an account?',
                                  style: TextStyle(color: Colors.white),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) { SignUpForm()},
                                  ),
                                ),
                                child: Container(
                                  child: const Text(
                                    ' Signup.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                ),
                              ),
                            ],
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
