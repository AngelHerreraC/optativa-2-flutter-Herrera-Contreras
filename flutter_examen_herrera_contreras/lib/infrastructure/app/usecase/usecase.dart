abstract class UseCase<Response, Params> {
  Future<Response> call(Params params);
}

