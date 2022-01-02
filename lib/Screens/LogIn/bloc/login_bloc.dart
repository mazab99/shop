import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Screens/LogIn/bloc/login_states.dart';
import 'package:shop/Screens/LogIn/login_model.dart';
import 'package:shop/data/api/dio_helper.dart';
import 'package:shop/shared/network/end_point.dart';

class LoginBloc extends Cubit<LogInState> {
  LoginBloc() : super(LoginInitialState());

  static LoginBloc get(context) => BlocProvider.of(context);
  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginSLoadingState());
    DioHelper.postData(
      url: login,
      //ده اللي موجود في endPoint وهو ده ال url بتاع ال login وبيكون فوق جنب نوع ال API
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      loginModel=LoginModel.fromJson(value.data);
      print(loginModel!.data!.token);
      print(loginModel!.status);
      print(loginModel!.message);
      emit(LoginSucessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffixIcon = Icons.remove_red_eye_outlined;
  bool isObsecure = true;

  void changeSuffexIcon() {
    isObsecure = !isObsecure;
    suffixIcon =
        isObsecure ? Icons.remove_red_eye_outlined : Icons.visibility_off;

    emit(SuffixIconState());
  }
}
