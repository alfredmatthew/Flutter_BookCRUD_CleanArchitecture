import 'package:dartz/dartz.dart';
import 'package:flutterxspringboot/domain/entity/book_entity.dart';
import 'package:flutterxspringboot/domain/repositories/repositories_domain.dart';

class GetGetbook {
  final RepositoriesDomain repositoriesDomain;

  GetGetbook(this.repositoriesDomain);

  Future<Either<String, BookEntity>> fetchBook(String isbn) {
    return repositoriesDomain.getBook(isbn);
  }
}
