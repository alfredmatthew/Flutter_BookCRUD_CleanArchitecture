import 'package:dartz/dartz.dart';
import 'package:flutterxspringboot/domain/repositories/repositories_domain.dart';

class GetDeletebook {
  final RepositoriesDomain repositoriesDomain;

  GetDeletebook(this.repositoriesDomain);

  Future<Either<String, String>> fetchDelete(String isbn) {
    return repositoriesDomain.deleteBook(isbn);
  }
}
