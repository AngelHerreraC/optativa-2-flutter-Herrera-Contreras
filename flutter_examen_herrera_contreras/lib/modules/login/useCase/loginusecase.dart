import 'package:flutter_examen_herrera_contreras/infrastructure/app/usecase/usecase.dart';
import 'package:flutter_examen_herrera_contreras/modules/login/domain/dto/usercredentials.dart';
import 'package:flutter_examen_herrera_contreras/modules/login/domain/dto/usertokenresponse.dart';
import 'package:flutter_examen_herrera_contreras/modules/login/domain/repository/loginrepository.dart';

class loginUseCase implements UseCase<dynamic, userCredentials>{
  @override
  Future<dynamic> call(userCredentials params) async {
    final userCredentials credentials = userCredentials(username: params.username, password: params.password);
    final userTokenResponse response = await loginRepository().execute(credentials);

    //guardar token en localstorage

    return response;
  }
  
}