import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc_states.dart';
import 'package:shop/shared/components/components.dart';

class SettingsScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopBloc, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopBloc
              .get(context)
              .userModel != null,
          builder: (context) {
            var model = ShopBloc.get(context);
            nameController.text = model.userModel!.data!.name!;
            emailController.text = model.userModel!.data!.email!;
            phoneController.text = model.userModel!.data!.phone!;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid User Name!';
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
                      //prefix: Icon(Icons.person,color: Colors.blue,),
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
                    height: 50,
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
                    height: 50,
                  ),
                  TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a valid User Phone!';
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
                    height: 50,
                  ),
                  MaterialButton(
                    onPressed: (){
                      AppLogout(context);
                    },
                    child:Text('LogOut'),
                  ),
                ],
              ),
            );
          },
          fallback: (context) =>
              Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
        );
      },
    );
  }
}
