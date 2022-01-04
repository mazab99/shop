class LoginModel {
  //هنبعت هنا الداتا بناءا علي الخرج بتاع ال LOGIN
  bool status;
  String message;
  UserData data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    //data = json['data'] ;   //كده الداتا ممكن متجيش يعني ممكن يحص اي ايرور
    //عشان كده هنعمل السطر اللي جاي ده نقوله لو الداتا لا تساوي null جيب الداتا غير كده خليها null
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  //  ده هيعمل عمل غير اللي فوق  named constructor
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
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
