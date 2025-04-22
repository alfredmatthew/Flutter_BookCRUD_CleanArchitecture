import 'package:dartz/dartz.dart';
import 'package:flutterxspringboot/domain/entity/book_entity.dart';
import 'package:flutterxspringboot/domain/repositories/repositories_domain.dart';

class GetGetlistbook {
  final RepositoriesDomain repositoriesDomain;

  GetGetlistbook(this.repositoriesDomain);

  Future<Either<String, List<BookEntity>>> fetchListBook() {
    return repositoriesDomain.getListBook();
  }
}
