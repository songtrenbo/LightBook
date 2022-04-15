import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final Icon icon;
  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(90),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(
            Icons.phone,
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(90),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(8),
          focusColor: Colors.white),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
