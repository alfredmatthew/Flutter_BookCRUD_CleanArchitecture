part of 'delete_book_cubit.dart';

@immutable
sealed class DeleteBookState {}

final class DeleteBookInitial extends DeleteBookState {}

final class DeleteBookSuccess extends DeleteBookState {
  final String message;

  DeleteBookSuccess({required this.message});
}

final class DeleteBookError extends DeleteBookState {
  final String errorMessage;

  DeleteBookError({required this.errorMessage});
}
