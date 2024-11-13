abstract class IConnection {
  update<T, D>(String url, D data, {Map<String, String>? headers}) async {
    throw UnimplementedError();
  }

  delete<T, D>(String url, {Map<String, String>? headers}) async {
    throw UnimplementedError();
  }

  post<T, D>(String url, D data, {Map<String, String>? headers}) async {
    throw UnimplementedError();
  }

  get<T>(String url, {Map<String, String>? headers}) async {
    throw UnimplementedError();
  }
}
