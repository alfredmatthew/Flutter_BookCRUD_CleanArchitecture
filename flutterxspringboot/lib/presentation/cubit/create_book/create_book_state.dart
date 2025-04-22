part of 'create_book_cubit.dart';

@immutable
sealed class CreateBookState {}

final class CreateBookInitial extends CreateBookState {}

final class CreateBookLoaded extends CreateBookState {
  final BookEntity bookEntity;
  final String message;
  final enumStatus EnumStatus;

  CreateBookLoaded(this.bookEntity, this.message, this.EnumStatus);
}

final class CreateBookError extends CreateBookState {
  final String errorMessage;
  final enumStatus EnumStatus;

  CreateBookError(this.errorMessage, this.EnumStatus);
}
