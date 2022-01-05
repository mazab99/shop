import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Screens/Categories/categories_model.dart';
import 'package:shop/Screens/Categories/categories_screen.dart';
import 'package:shop/Screens/Favourites/change_fav_model.dart';
import 'package:shop/Screens/Favourites/favorites_screen.dart';
import 'package:shop/Screens/Favourites/favourites_model.dart';
import 'package:shop/Screens/Home/home_model.dart';
import 'package:shop/Screens/Home/home_screen.dart';
import 'package:shop/Screens/LogIn/login_model.dart';
import 'package:shop/Screens/Settingss/settings_screen.dart';
import 'package:shop/data/api/dio_helper.dart';
import 'package:shop/shared/components/components.dart';
import 'package:shop/shared/network/Local%20Network/SharedPreferances/cashe_helper.dart';
import 'package:shop/shared/network/end_point.dart';

import 'bloc_states.dart';

class ShopBloc extends Cubit<ShopStates> {
  ShopBloc() : super(ShopInitialState());

  static ShopBloc get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  String keyWord;
  bool isDark = false;
  bool isRtl = true;

//تحط هنا الاسكرينات اللي عندك  في التطبيق عشان لو هتستخدمهم  في ال BottomNavigationBar
  List<Widget> screens = [
    HomeScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    ProfileScreen(),
  ];

  List<BottomNavigationBarItem> bottomItemsArabic = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'المنتجات',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.category,
      ),
      label: 'الاصناف',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite,
      ),
      label: 'المفضله',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'الملف الشخصي',
    ),
  ];

  List<BottomNavigationBarItem> bottomItemsEnglish = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.category,
      ),
      label: 'Category',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite,
      ),
      label: 'Favorite',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.account_box_outlined,
      ),
      label: 'Account',
    ),
  ];

  //دي عشان لما تغير بين موود ال dark ,light

  void changeAppMode({bool fromShared})
  {
    if (fromShared != null)
    {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else
    {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }

// //دي عشان لما تغير اتجاه البرنامج من اليمين للشمال
  void changeAppDirection({bool fromShared}) {
    if (fromShared != null) {
      isRtl = fromShared;
      emit(ShopChangeDirectionState());
    } else {
      isRtl = !isRtl;
      CacheHelper.saveData(key: 'isRtl', value: isRtl).then((value) {
        emit(ShopChangeDirectionState());
      });
    }
  }

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ShopBottomNavState());
  }

  ////////////////////////////////////////

  //////////////////////////////////////
  HomeModel homeModel;
  Map<int, bool> favourutes = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: home, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
    //  printFullText(homeModel!.data!.banners[0].image.toString());
     // printFullText(homeModel!.status.toString());
      homeModel.data.products.forEach((element) {
        favourutes.addAll({
          element.id: element.in_favorites,
        });
      });
    //  printFullText(favourutes.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
     // printFullText(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

///////////////////////////////////////////////////
  CategoriesModel categoriesModel;

  void getCategories() {
    DioHelper.getData(url: getCatrgories, token: token).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
     // printFullText(categoriesModel!.status.toString());
      emit(ShopSuccessCategoriesState());
    }).catchError((e) {
     // printFullText(e.toString());
      emit(ShopErrorCategoriesState(e.toString()));
    });
  }

///////////////////////////////////////
  FavoritesModel favoritesModel;

  void getFavorite() {
    emit(ShopLoadingGetFavoritesState());

    DioHelper.getData(
      url: getFavorites,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }

  ////////////////////////
  ChangeFavModel changeFavModel;

  void changeFavouriteStatus(int productId) {
    favourutes[productId] = !favourutes[productId];
    emit(ShopChangeFavState());
    DioHelper.postData(
      url: getFavorites,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavModel = ChangeFavModel.fromJson(value.data);
      printFullText('Item Status${value.data}');
      if (!changeFavModel.status) {
        favourutes[productId] = !favourutes[productId];
      } else {
        getFavorite();
      }
      emit(ShopSuccessChangeFavState(changeFavModel));
    }).catchError((e) {
      favourutes[productId] = !favourutes[productId];
      emit(ShopErrorChangeFavState(e));
    });
  }

////////////////////////////////////////
  LoginModel userModel;

  void getUserData() {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      printFullText(userModel.data.name.toString());
      emit(ShopSuccessUserDataState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({
    @required String name,
    @required String email,
    @required String phone,
  }) {
    emit(ShopLoadingUpdateUserState());

    DioHelper.postData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      printFullText(userModel.data.name);

      emit(ShopSuccessUpdateUserState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }
}
