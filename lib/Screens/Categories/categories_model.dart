class CategoriesModel {
  //هنبعت هنا الداتا بناءا علي الخرج بتاع ال Api
  bool? status;
  // String? message;
  CategoriesDataModel? data;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    //message = json['message'];
    //data = json['data'] ;   //كده الداتا ممكن متجيش يعني ممكن يحص اي ايرور
    //عشان كده هنعمل السطر اللي جاي ده نقوله لو الداتا لا تساوي null جيب الداتا غير كده خليها null
    data = json['data'] != null
        ? CategoriesDataModel.fromJson(json['data'])
        : null;
  }
}

class CategoriesDataModel {
  int? current_page;
  String? first_page_url;
  int? from;
  int? last_page;
  String? last_page_url;
  String? next_page_url;
  String? path;
  dynamic prev_page_url;
  int? per_page;
  int? to;
  int? total;

  List<DataModel> data = []; //تعملها بعد ما تعمل كلاس DataModel

  CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    current_page=json['current_page'];
    first_page_url=json['first_page_url'];
    from=json['from'];
    last_page=json['last_page'];
    last_page_url=json['last_page_url'];
    next_page_url=json['next_page_url'];
    path=json['path'];
    prev_page_url=json['prev_page_url'];
    per_page=json['per_page'];
    to=json['to'];
    total=json['total'];

    json['data'].forEach((element) {
      data.add(DataModel.fromJson(element));
    });
  }
}
//الكلاس ده بيكون عباره عن متغير زي اللي فوق بس يحتوي علي اكثر من متغير يعني داتا
class DataModel {
  int? id;
  String? name;
  String? image;

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
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
