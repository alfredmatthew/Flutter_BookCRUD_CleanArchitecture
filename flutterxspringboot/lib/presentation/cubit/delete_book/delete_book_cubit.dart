import 'package:bloc/bloc.dart';
import 'package:flutterxspringboot/domain/usecase/get_deletebook.dart';
import 'package:meta/meta.dart';

part 'delete_book_state.dart';

class DeleteBookCubit extends Cubit<DeleteBookState> {
  DeleteBookCubit(this.getDeletebook) : super(DeleteBookInitial());

  final GetDeletebook getDeletebook;

  deleteBook(String isbn) async {
    final result = await getDeletebook.fetchDelete(isbn);
    result.fold(
      (error) => emit(DeleteBookError(errorMessage: error)),
      (message) => emit(DeleteBookSuccess(message: message)),
    );
  }
}
