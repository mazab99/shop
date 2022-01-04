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
  @required String text,
  @required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: choseToastColor(state),
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
        CacheHelper.removeData(key: 'token').then((value) {
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



Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultTextButton({
  @required Function function,
  @required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTap,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );