import 'package:dartz/dartz.dart';
import 'package:flutterxspringboot/data/repositories/remote_data_impl.dart';
import 'package:flutterxspringboot/domain/entity/book_entity.dart';
import 'package:flutterxspringboot/domain/repositories/repositories_domain.dart';

class Repositorydomainimpl implements RepositoriesDomain {
  final RemoteDataImpl remoteDataImpl;

  Repositorydomainimpl(this.remoteDataImpl);

  @override
  Future<Either<String, String>> deleteBook(String isbn) async {
    try {
      final result = await remoteDataImpl.deleteBookModel(isbn);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, BookEntity>> getBook(String isbn) async {
    try {
      final result = await remoteDataImpl.bookModel(isbn);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, BookEntity>> getCreateBook(
    String isbn,
    String author,
    String title,
  ) async {
    try {
      final result = await remoteDataImpl.createBookModel(isbn, author, title);
      return Right(result.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<BookEntity>>> getListBook() async {
    try {
      final result = await remoteDataImpl.listBookModel();
      return Right(result.map((book) => book.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
