import 'dart:convert';
import 'package:flutterxspringboot/data/datasource/remote_data.dart';
import 'package:http/http.dart' as http;
import 'package:flutterxspringboot/data/model/book_model.dart';
import 'dart:developer' as developer;

class RemoteDataImpl implements RemoteData {
  final String baseUrl = "http://192.168.98.29:8083/";
  final http.Client client;

  RemoteDataImpl(this.client);

  @override
  Future<BookModel> createBookModel(
    String isbn,
    String author,
    String title,
  ) async {
    try {
      final response = await client.put(
        Uri.parse('${baseUrl}books/$isbn'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'isbn': isbn, 'author': author, 'title': title}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return BookModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create book: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating book: $e');
    }
  }

  @override
  Future<List<BookModel>> listBookModel() async {
    try {
      final response = await client.get(Uri.parse('${baseUrl}books'));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => BookModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load books: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching books: $e');
    }
  }

  @override
  Future<BookModel> bookModel(String isbn) async {
    try {
      final response = await client.get(Uri.parse('${baseUrl}books/$isbn'));

      if (response.statusCode == 200) {
        return BookModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
          'Failed to load book with ISBN $isbn: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error fetching book: $e');
    }
  }

  @override
  Future<String> deleteBookModel(String isbn) async {
    try {
      final response = await client.delete(Uri.parse('${baseUrl}books/$isbn'));
      developer.log('${response.statusCode}');

      if (response.statusCode == 204) {
        developer.log('Buku $isbn berhasil dihapus');
        return 'Book with ISBN $isbn deleted successfully';
      } else {
        developer.log('Buku $isbn gagal dihapus');
        throw Exception(
          'Failed to delete book: ${response.statusCode} di link ${baseUrl}$isbn',
        );
      }
    } catch (e) {
      developer.log('Error $e');
      throw Exception('Error deleting book: $e');
    }
  }
}
