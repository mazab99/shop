import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Screens/LogIn/login_screen.dart';
import 'package:shop/Screens/OnBoarding/onboarding.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc.dart';
import 'package:shop/business_logic/StateManagement/Bloc/bloc_states.dart';
import 'package:shop/data/api/dio_helper.dart';
import 'package:shop/layout/shop_layout.dart';
import 'package:shop/shared/Modes/dark_mode.dart';
import 'package:shop/shared/Modes/light_mode.dart';
import 'package:shop/shared/network/Local%20Network/SharedPreferances/cashe_helper.dart';
import 'package:shop/shared/network/end_point.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  bool? isDark = CashHelper.getData(key: 'isDark');
  bool? isRtl = CashHelper.getData(key: 'isRtl');
  Widget widget;
  bool? onboarding = CashHelper.getData(key: 'onBoarding');
  print(onboarding);
  token = CashHelper.getData(key: 'token');
  print('My Token is $token');

  if (onboarding != null) {
    if (token != null) {
      widget = ShopLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnboardingScreen();
  }

  runApp(MyApp(isDark, widget, isRtl));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  final bool? isRtl;
  final Widget startWidget;

  MyApp(this.isDark, this.startWidget, this.isRtl);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ShopBloc()
            ..getHomeData()
            ..getCategories()
            ..getFavourites()
            ..getUserData(),
        ),
      ],
      child: BlocConsumer<ShopBloc, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightmode,
          darkTheme: darkmode,
          themeMode:
              ShopBloc.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home: startWidget,
        ),
      ),
    );
  }
}
