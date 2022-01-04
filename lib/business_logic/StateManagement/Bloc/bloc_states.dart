import 'package:shop/Screens/Favourites/change_fav_model.dart';
import 'package:shop/Screens/LogIn/login_model.dart';

abstract class ShopStates {}

class ShopChangeModeState extends ShopStates {}

class ShopChangeDirectionState extends ShopStates {}

class ShopBottomNavState extends ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeBottomNavState extends ShopStates {}

//////////////////HOME//////////////////////////
class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {
}

/////////////////Categories///////////////////////////
class ShopSuccessCategoriesState extends ShopStates {}

class ShopErrorCategoriesState extends ShopStates {
  String error;

  ShopErrorCategoriesState(this.error);
}

/////////////////ChangeFav////////////////////////////
class ShopChangeFavState extends ShopStates {}

class ShopSuccessChangeFavState extends ShopStates {
  ChangeFavModel model;

  ShopSuccessChangeFavState(this.model);
}

class ShopErrorChangeFavState extends ShopStates {
  String error;

  ShopErrorChangeFavState(this.error);
}
///////////////////////////////////////////////////

class ShopLoadingGetFavoritesState extends ShopStates {}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {}

//////////////////////////////////////////////////
class ShopLoadingUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates {
  final LoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}
class ShopErrorUserDataState extends ShopStates {
}

/////////////////////////////////////////////////////
class ShopLoadingUpdateUserState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates
{
  final LoginModel loginModel;

  ShopSuccessUpdateUserState(this.loginModel);
}

class ShopErrorUpdateUserState extends ShopStates {}
///////////////////////////////////////////////
class AppChangeModeState extends ShopStates {}
