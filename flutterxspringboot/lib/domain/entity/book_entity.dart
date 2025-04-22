import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  String? isbn;
  String? author;
  String? title;

  BookEntity({this.isbn, this.author, this.title});

  @override
  // TODO: implement props
  List<Object?> get props => [isbn, author, title];
}
