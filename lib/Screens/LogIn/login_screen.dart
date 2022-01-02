import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/Screens/LogIn/bloc/login_bloc.dart';
import 'package:shop/Screens/LogIn/bloc/login_states.dart';
import 'package:shop/Screens/Register/register_screen.dart';
import 'package:shop/layout/shop_layout.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/network/Local%20Network/SharedPreferances/cashe_helper.dart';
import 'package:shop/shared/network/end_point.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LogInState>(
          listener: (context, state) {
            if (state is LoginSucessState) {
              if (state.loginModel.status!) {
                print(state.loginModel.data!.token!);
                print(state.loginModel.message);
                CashHelper.saveData(
                        key: 'token', value: state.loginModel.data!.token!)
                    .then((value) {
                  token = state.loginModel.data!.token!;
                  navigateandFinish(context, ShopLayout());
                });
                //showToast(states: ToastStates.SUCESS, text: state.loginModel.message.toString());
              } else {
                print(state.loginModel.message);
                showToast(
                    states: ToastStates.ERROR,
                    text: state.loginModel.message.toString());
              }
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  .0439524838,
                            ),
                            Container(
                              //width: MediaQuery.of(context).size.width * 0.7079439252336449,
                              height: MediaQuery.of(context).size.height *
                                  0.0259179265658747,
                              child: Text(
                                "To get started — Login to your account.",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: HexColor('0053CB'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height *
                                  .0259179266,
                            ),
                            Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Email
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                      color: HexColor('0053CB'),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .0086393089,
                                  ),
                                  TextFormField(
                                    controller: emailController,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains('@') ||
                                          !value.contains('.')) {
                                        return 'Enter a valid User Email!';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.blue),
                                    maxLines: 1,
                                    cursorColor:
                                        Color.fromRGBO(180, 26, 26, 1.0),
                                    textAlign: TextAlign.start,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your Email',
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: HexColor('BBDEFB'),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: HexColor('E3F2FD'),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.green,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black12,
                                        ),
                                      ),
                                      focusColor: Colors.yellow,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .0259179266,
                                  ),
                                  //Password
                                  Text(
                                    'Password',
                                    style: TextStyle(
                                      color: HexColor('0053CB'),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .0086393089,
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 8) {
                                        return 'Password is to short at least 8 !';
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: (value) {
                                      if (formKey.currentState!.validate()) {
                                        LoginBloc.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.blue),
                                    maxLines: 1,
                                    cursorColor:
                                        Color.fromRGBO(180, 26, 26, 1.0),
                                    textAlign: TextAlign.start,
                                    obscureText:
                                        LoginBloc.get(context).isObsecure,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          LoginBloc.get(context).suffixIcon,
                                          color: HexColor('0053CB'),
                                        ),
                                        onPressed: LoginBloc.get(context)
                                            .changeSuffexIcon,
                                      ),
                                      hintText: 'Enter your Password',
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: HexColor('BBDEFB'),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: HexColor('E3F2FD'),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.green,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black12,
                                        ),
                                      ),
                                      focusColor: Colors.yellow,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .024838013,
                                  ),
                                  Text(
                                    'Reset your password?',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor('0053CB'),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .343412527,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .060475162,
                                    width: MediaQuery.of(context).size.width *
                                        .9252336449,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFF0D47A1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: ConditionalBuilder(
                                      condition: state is! LoginSLoadingState,
                                      builder: (context) => MaterialButton(
                                        child: Text("Login",
                                            style: TextStyle(
                                                color: HexColor('FFFFFF'),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal)),
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            LoginBloc.get(context).userLogin(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            );
                                            // navigateTo(context, SearchScreen());
                                          }
                                        },
                                      ),
                                      fallback: (context) => Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .0159179266,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          navigateTo(context, SignUpScreen());
                                        },
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'Don’t have an account? ',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.normal,
                                                  color: HexColor('1E88E5'),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Sign up',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.normal,
                                                  color: HexColor('1565C0'),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .0863930886,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
