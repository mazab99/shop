import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/Screens/LogIn/login_screen.dart';
import 'package:shop/shared/components/components.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  bool isObsecure = true;
  bool isInstructor = true;
  bool isChecked = false;

  void _switch() {
    setState(() {
      isObsecure = !isObsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .0539956803,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .0439524838,
                ),
                Text(
                  "To get started — Please create a new account.",
                  //softWrap: true,
                  //maxLines: 1,
                  style: TextStyle(
                    //overflow: TextOverflow.ellipsis,
                    fontSize: 18,
                    height: .0259179266,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    color: HexColor('0053CB'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02591792657,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Name
                      Text(
                        'Name',
                        style: TextStyle(
                          color: HexColor('0053CB'),
                          fontSize: 14,
                          //height:0.01727861771 ,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * .0086393089,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              value.contains('@') ||
                              value.contains('.')) {
                            return 'Enter a valid Name!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: HexColor('0053CB'),
                        ),
                        maxLines: 1,
                        cursorColor: HexColor('0053CB'),
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: 'Enter your full name',
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
                        height:
                        MediaQuery.of(context).size.height * .0259179266,
                      ),
                      //Email
                      Text(
                        'Email',
                        style: TextStyle(
                          color: HexColor('0053CB'),
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * .0086393089,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.')) {
                            return 'Enter a valid User Email!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                        maxLines: 1,
                        cursorColor: Color.fromRGBO(180, 26, 26, 1.0),
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
                        height:
                        MediaQuery.of(context).size.height * .0259179266,
                      ),
                      //Password
                      Text(
                        'Password',
                        style: TextStyle(
                          color: HexColor('0053CB'),
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * .0086393089,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return 'Password is to short at least 8 !';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                        maxLines: 1,
                        cursorColor: Color.fromRGBO(180, 26, 26, 1.0),
                        textAlign: TextAlign.start,
                        obscureText: isObsecure,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          suffixIcon: Container(
                            height: MediaQuery.of(context).size.height *
                                .0259179266,
                            width:
                            MediaQuery.of(context).size.width * .0259179266,
                            child: IconButton(
                              onPressed: () {
                                _switch();
                              },
                              icon: Icon(
                                isObsecure
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.visibility_off,
                                color: HexColor('0053CB'),
                              ),
                            ),
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
                        height:
                        MediaQuery.of(context).size.height * .0086393089,
                      ),
                      Text(
                        'Your Password should be 8 letters or more.',
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: HexColor('0053CB'),
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * .0259179266,
                      ),
                      Text(
                        'Please choose your role',
                        style: TextStyle(
                          fontSize: 14,
                          color: HexColor('0053CB'),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * .0086393089,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isInstructor = true;
                                });
                              },
                              child: Container(
                                alignment: AlignmentDirectional.center,
                                height: 50,
                                child: Text(
                                  'Instructor',
                                  style: TextStyle(
                                      color: HexColor('0053CB'),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: HexColor('0053CB'),
                                  ),
                                  color: isInstructor
                                      ? Colors.lightGreenAccent
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width:
                            MediaQuery.of(context).size.width * .0172786177,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isInstructor = false;
                                });
                              },
                              child: Container(
                                alignment: AlignmentDirectional.center,
                                height: 50,
                                child: Text(
                                  'Student',
                                  style: TextStyle(
                                      color: HexColor('0053CB'),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: HexColor('0053CB'),
                                  ),
                                  color: isInstructor
                                      ? Colors.white
                                      : Colors.lightGreenAccent,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * .0259179266,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .0259179266,
                        child: Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = true;
                                });
                              },
                              checkColor: Colors.white,
                              focusColor: Colors.red,
                              activeColor: HexColor('0053CB'),
                            ),
                            SizedBox(
                              width:
                              MediaQuery.of(context).size.width * .0129589633,
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'You have read and agree our ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      color: HexColor('1E88E5'),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      color: HexColor('0053CB'),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * .0831533477,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .060475162,
                        width: MediaQuery.of(context).size.width * .9252336449,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF0D47A1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: MaterialButton(
                          child: Text("Create a new account",
                              style: TextStyle(
                                  color: HexColor('FFFFFF'),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal)),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              navigateTo(context, LoginScreen());
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                  duration: Duration(milliseconds: 2),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height:
                        MediaQuery.of(context).size.height * .0259179266,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              navigateTo(context, LoginScreen());
                            },
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      color: HexColor('1E88E5'),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'LogIn',
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
    );
  }
}
