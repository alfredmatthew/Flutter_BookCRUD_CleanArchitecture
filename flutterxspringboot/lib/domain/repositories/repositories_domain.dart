import 'package:dartz/dartz.dart';
import 'package:flutterxspringboot/domain/entity/book_entity.dart';

abstract class RepositoriesDomain {
  //Create and Update
  Future<Either<String, BookEntity>> getCreateBook(
    String isbn,
    String author,
    String title,
  );

  // Read
  Future<Either<String, List<BookEntity>>> getListBook();
  Future<Either<String, BookEntity>> getBook(String isbn);

  // Delete
  Future<Either<String, String>> deleteBook(String isbn);
}
