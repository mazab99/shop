class HomeModel {
  //هنبعت هنا الداتا بناءا علي الخرج بتاع ال Api
  bool? status;

  // String? message;
  HomeDataModel? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    //message = json['message'];
    //data = json['data'] ;   //كده الداتا ممكن متجيش يعني ممكن يحص اي ايرور
    //عشان كده هنعمل السطر اللي جاي ده نقوله لو الداتا لا تساوي null جيب الداتا غير كده خليها null
    data = json['data'] != null ? HomeDataModel.fromJson(json['data']) : null;
  }
}

class HomeDataModel {

  List<BannersModel> banners = [];//تعملها بعد ما تعمل كلاس BannersModel
  List<ProductsModel> products = [];//تعملها بعد ما تعمل كلاس ProductsModel

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(BannersModel.fromJson(element));
    });

    json['products'].forEach((element) {
      products.add(ProductsModel.fromJson(element));
    });
  }
}

class BannersModel {
  int? id;
  String? image;

  BannersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductsModel {
  int? id;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  String? image;
  String? name;
  bool? in_favorites;
  bool? in_cart;
  //String? description;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
    //description=json['description'];
  }
}

//ده شكل الخرج لما تضغط send بتاع ال login
// {
// "status": true,
// "message": "تم تسجيل الدخول بنجاح",
// "data":
// {
// "id": 10220,
// "name": "Mahmoud Azab",
// "email": "mahmoudazab@gmail.com",
// "phone": "01090376780",
// "image": "https://student.valuxapps.com/storage/assets/defaults/user.jpg",
// "points": 0,
// "credit": 0,
// "token": "fiOP8UiVgCkIwZV8tkLWWywOniTlSFYYrY70mF8B6w6MiMnyDz2mihzcq8FSRrTTCAEujZ"
// }
// }
