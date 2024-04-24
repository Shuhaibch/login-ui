import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:job/user_model.dart';

class UserImplentation {
  static Future getProductDetails(String email, String password) async {
    log('message');
    try {
      var responce = await http.post(
          Uri.parse('http://axnoldigitalsolutions.in/Training/api/login'),
          body: {
            "email": email,
            "password": password,
             
          });
      if (responce.statusCode == 200 || responce.statusCode == 201) {
        final UserModel user = UserModel.fromJson(jsonDecode(responce.body));
        print(user.message);
        return {"status": true, "data": user};
      } else {
        return {"status": false, "data": "failed while fetching"};
      }
    } catch (e) {
      print(e);
      return {"status": false, "data": "failed while fetching"};
    }
  }
}
