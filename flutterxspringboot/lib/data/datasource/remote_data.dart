import 'package:flutterxspringboot/data/model/book_model.dart';

abstract class RemoteData {
  //Create and Update
  Future<BookModel> createBookModel(String isbn, String author, String title);

  // Read
  Future<List<BookModel>> listBookModel();
  Future<BookModel> bookModel(String isbn);

  // Delete
  Future<String> deleteBookModel(String isbn);
}
