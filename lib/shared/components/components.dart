import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/Screens/LogIn/login_screen.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc.dart';
import 'package:shop/shared/constants/my_colors.dart';
import 'package:shop/shared/network/Local%20Network/SharedPreferances/cashe_helper.dart';

Widget divider() => Divider(
      thickness: 0.3,
      color: MyColors.dark,
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  String? Function(String?)? validate,
  VoidCallback? onPressed,
  Function(String?)? onChanged,
  required IconData prefixIcon,
  double borderRadius = 0,
  String? hint,
  IconData? suffixIcon,
  bool isPassword = false,
  required bool isRtl,
  Color color = Colors.black,
  Color textColor = Colors.white,
}) =>
    TextFormField(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      textAlign: isRtl ? TextAlign.right : TextAlign.left,
      controller: controller,
      style: TextStyle(
        color: textColor,
      ),
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.blue),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: color,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  suffixIcon,
                ),
              )
            : null,
      ),
      validator: validate,
      onChanged: onChanged,
      onTap: onPressed,
    );

//navigateTo(context,ScreenName()); <<==لما تعمل انتقال بين شاشتين تستخدما وتحط في الزر اللي يعمل انتقال
void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Widget appBarText(context) => Text(
      ShopBloc.get(context).isRtl ? 'المتجر - ShopApp' : 'ShopApp - المتجر',
    );

void navigateandFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        (Route<dynamic> route) => false);

void showToast({
  required String text,
  required ToastStates states,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: choseToastColor(states),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { SUCESS, ERROR, WARNING }

Color choseToastColor(ToastStates states) {
  Color color;
  switch (states) {
    case ToastStates.SUCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}

Widget AppLogout(context) => TextButton(
      //ده بيعمل clear ل  token
      //وبيعمل navigateAndFinish لل LOGin
      child: Text('Logout'),
      onPressed: () {
        CashHelper.removeData(key: 'token').then((value) {
          if (value) {
            navigateandFinish(context, LoginScreen());
          }
        });
      },
    );

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); //800 >>size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


