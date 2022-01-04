import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Screens/Search/search_screen.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc_states.dart';
import 'package:shop/shared/components/components.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopBloc, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopBloc.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                navigateTo(context, SearchScreen());
              },
              icon: Icon(
                Icons.search,
                color: Colors.blue,
                size: 30,
              ),
            ),
            title: appBarText(context),
            actions: [
              IconButton(
                onPressed: () {
                 // navigateTo(context, SettingsScreen());
                },
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              // IconButton(
              //     onPressed: () {
              //       ShopBloc.get(context).changeAppMode();
              //     },
              //     icon: Icon(
              //       Icons.brightness_4_rounded,
              //     )),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black54, spreadRadius: 0, blurRadius: 5),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                items: cubit.isRtl
                    ? cubit.bottomItemsArabic
                    : cubit.bottomItemsEnglish,
                currentIndex: cubit.currentIndex,
                onTap: (index) => cubit.changeBottomNavBar(index),
              ),
            ),
          ),
        );
      },
    );
  }
}
