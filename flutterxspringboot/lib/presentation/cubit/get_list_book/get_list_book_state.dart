part of 'get_list_book_cubit.dart';

@immutable
sealed class GetListBookState {}

final class GetListBookInitial extends GetListBookState {}

final class ListBookLoaded extends GetListBookState {
  final List<BookEntity> book;
  final String message;

  ListBookLoaded({required this.book, required this.message});
}

final class ListBookError extends GetListBookState {
  final String message;

  ListBookError({required this.message});
}
