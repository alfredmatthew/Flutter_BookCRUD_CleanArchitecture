// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutterxspringboot/domain/entity/book_entity.dart';
import 'package:flutterxspringboot/domain/repositories/repositories_domain.dart';

class GetCreatebook {
  final RepositoriesDomain repositoriesDomain;

  GetCreatebook(this.repositoriesDomain);

  Future<Either<String, BookEntity>> fetchCreateBook(
    String isbn,
    String author,
    String title,
  ) {
    return repositoriesDomain.getCreateBook(isbn, author, title);
  }
}
