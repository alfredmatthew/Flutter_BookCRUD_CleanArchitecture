import 'package:equatable/equatable.dart';
import 'package:flutterxspringboot/domain/entity/book_entity.dart';

class BookModel extends Equatable {
  String? isbn;
  String? author;
  String? title;

  BookModel({this.isbn, this.author, this.title});

  BookModel.fromJson(Map<String, dynamic> json) {
    isbn = json['isbn'];
    author = json['author'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbn'] = this.isbn;
    data['author'] = this.author;
    data['title'] = this.title;
    return data;
  }

  BookEntity toEntity() => BookEntity(isbn: isbn, author: author, title: title);

  @override
  // TODO: implement props
  List<Object?> get props => [isbn, author, title];
}
