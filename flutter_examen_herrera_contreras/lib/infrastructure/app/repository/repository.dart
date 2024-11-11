import "package:flutter_examen_herrera_contreras/infrastructure/connection/connection.dart";

abstract class Repository<T, P> {
  Future<T> execute(P data);
  Connection repoConnection = Connection();
}
