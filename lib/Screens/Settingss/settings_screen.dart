import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc_states.dart';
import 'package:shop/shared/components/components.dart';

class SettingsScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopBloc, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = ShopBloc.get(context).userModel;

        nameController.text = model.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;

        return ConditionalBuilder(
          condition: ShopBloc.get(context).userModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if (state is ShopLoadingUpdateUserState)
                    LinearProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter a valid User name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                    maxLines: 1,
                    cursorColor: Color.fromRGBO(180, 26, 26, 1.0),
                    textAlign: TextAlign.start,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'Enter your Name',
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
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter a valid User Email';
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
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter a valid User Phone';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                    maxLines: 1,
                    cursorColor: Color.fromRGBO(180, 26, 26, 1.0),
                    textAlign: TextAlign.start,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'Enter your Phone',
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
                    height: 20.0,
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
                    child: MaterialButton(
                      child: Text("Update",
                          style: TextStyle(
                              color: HexColor('FFFFFF'),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal)),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          ShopBloc.get(context).updateUserData(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text,
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
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
                    child: MaterialButton(
                      child: Text("Logout",
                          style: TextStyle(
                              color: HexColor('FFFFFF'),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal)),
                      onPressed: () {
                        AppLogout(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
