import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lightbook_flutter/constant/color.dart';

Widget buttonBorderRound({
  required BuildContext context,
  required String nameButton,
  required IconData icon,
  Color colorIcon = Colors.black,
  Function()? onClick = null,
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
    child: SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        icon: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            height: 40.0,
            width: 40.0,
            color: colorIcon,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0), //or 15.0
                child: Container(
                  height: 25.0,
                  width: 25.0,
                  color: Colors.white,
                  child: Icon(icon, color: colorIcon, size: 20.0),
                ),
              ),
            ),
          ),
        ),
        onPressed: onClick,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(ColorConstants.buttonColor),
          alignment: Alignment.centerLeft,
        ),
        label: Text(
          nameButton,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    ),
  );
}

Widget textFieldInput(
    {required String hintText,
    required IconData icon,
    TextEditingController? controller = null,
    bool enable = true,
    bool isPass = true,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Color backgroundColor = ColorConstants.primaryColor}) {
  return TextField(
    controller: controller,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
        fillColor: backgroundColor,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(90),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(90),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        focusColor: Colors.white),
    keyboardType: keyboardType,
    obscureText: isPass,
  );
}

Future<bool?> toastNotify(String msg,
    {ToastGravity toastGravity = ToastGravity.BOTTOM}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: toastGravity,
      timeInSecForIosWeb: 1,
      // backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
