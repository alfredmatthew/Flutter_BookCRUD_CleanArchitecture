import 'package:bloc/bloc.dart';
import 'package:flutterxspringboot/domain/entity/book_entity.dart';
import 'package:flutterxspringboot/domain/usecase/get_getlistbook.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'get_list_book_state.dart';

class GetListBookCubit extends Cubit<GetListBookState> {
  GetListBookCubit(this.getGetlistbook) : super(GetListBookInitial());

  final GetGetlistbook getGetlistbook;
  static final controller = RefreshController();

  getListBook() async {
    emit(GetListBookInitial());
    final result = await getGetlistbook.fetchListBook();
    result.fold(
      (error) {
        controller.refreshCompleted;
        emit(ListBookError(message: error));
      },
      (books) {
        controller.refreshCompleted;
        emit(ListBookLoaded(book: books, message: "Books loaded successfully"));
      },
    );
  }

  getRefresh() {
    getListBook();
  }
}
