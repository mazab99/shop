
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
  String error;
  ShopErrorHomeDataState(this.error);
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

class ShopLoadingGetFavState extends ShopStates {}

class ShopSuccessGetFavState extends ShopStates {}

class ShopErrorGetFavState extends ShopStates {
  String e;
  ShopErrorGetFavState(this.e);
}
//////////////////////////////////////////////////
class ShopLoadingUserDataState extends ShopStates {}

class ShopSuccessUserDataState extends ShopStates {
 final LoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}

class ShopErrorUserDataState extends ShopStates {
  String e;
  ShopErrorUserDataState(this.e);
}
/////////////////////////////////////////////////////
class ShopLoadingUpdateUserState extends ShopStates {}

class ShopSuccessUpdateUserState extends ShopStates {}

class ShopErrorUpdateUserState extends ShopStates {
  String e;
  ShopErrorUpdateUserState(this.e);
}
///////////////////////////////////////////////
