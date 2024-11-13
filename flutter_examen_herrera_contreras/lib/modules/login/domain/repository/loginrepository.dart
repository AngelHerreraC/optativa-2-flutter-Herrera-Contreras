import 'package:flutter_examen_herrera_contreras/infrastructure/app/repository/repository.dart';
import 'package:flutter_examen_herrera_contreras/infrastructure/connection/connection.dart';
import 'package:flutter_examen_herrera_contreras/modules/login/domain/dto/usercredentials.dart';
import 'package:flutter_examen_herrera_contreras/modules/login/domain/dto/usertokenresponse.dart';
import 'package:flutter_examen_herrera_contreras/services/auth.dart';
import 'package:http/http.dart';

class loginRepository implements Repository<userTokenResponse, userCredentials>{

  @override
  Connection repoConnection = Connection();

  @override
  Future<userTokenResponse> execute(userCredentials data) async {
    final outData = {
      "username": data.username,
      "password": data.password,
      "expiresInMins": 60,
    };
    String url = "https://dummyjson.com/auth/login";


    final headers = {
      'Content-Type': 'application/json',
      /*if(token != null) 'Authorization':'Bearer $token',*/ 
    };

    final response = await repoConnection.post(url, outData, headers: headers);

    return userTokenResponse.fromJson(response);
  }

}