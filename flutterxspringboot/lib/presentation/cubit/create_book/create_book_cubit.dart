import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterxspringboot/common/enum_status.dart';
import 'package:flutterxspringboot/domain/entity/book_entity.dart';
import 'package:flutterxspringboot/domain/usecase/get_createbook.dart';
import 'package:meta/meta.dart';

part 'create_book_state.dart';

class CreateBookCubit extends Cubit<CreateBookState> {
  CreateBookCubit(this.getCreatebook) : super(CreateBookInitial());

  final GetCreatebook getCreatebook;
  static final isbn = TextEditingController();
  static final title = TextEditingController();
  static final author = TextEditingController();

  getBookCreate(BuildContext context) async {
    emit(CreateBookInitial());
    final result = await getCreatebook.fetchCreateBook(
      isbn.text,
      author.text,
      title.text,
    );
    result.fold(
      (error) => emit(CreateBookError(error, enumStatus.error)),
      (book) => emit(
        CreateBookLoaded(book, "Book created successfully", enumStatus.loaded),
      ),
    );
  }
}
