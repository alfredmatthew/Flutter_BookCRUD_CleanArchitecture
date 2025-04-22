import 'package:flutterxspringboot/presentation/cubit/create_book/create_book_cubit.dart';
import 'package:flutterxspringboot/presentation/cubit/delete_book/delete_book_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:flutterxspringboot/data/datasource/remote_data.dart';
import 'package:flutterxspringboot/data/repositories/remote_data_impl.dart';
import 'package:flutterxspringboot/data/repositories/RepositoryDomainImpl.dart';
import 'package:flutterxspringboot/domain/repositories/repositories_domain.dart';
import 'package:flutterxspringboot/domain/usecase/get_createbook.dart';
import 'package:flutterxspringboot/domain/usecase/get_deletebook.dart';
import 'package:flutterxspringboot/domain/usecase/get_getbook.dart';
import 'package:flutterxspringboot/domain/usecase/get_getlistbook.dart';
import 'package:flutterxspringboot/presentation/cubit/get_list_book/get_list_book_cubit.dart';

final locator = GetIt.instance;

void setupLocator() {
  // External
  locator.registerFactory(() => Client());

  // Data sources
  locator.registerLazySingleton<RemoteData>(
    () => RemoteDataImpl(locator<Client>()),
  );

  // Repositories
  locator.registerLazySingleton<RepositoriesDomain>(
    () => Repositorydomainimpl(locator()),
  );
  locator.registerFactory(() => RemoteDataImpl(locator()));

  // Use cases
  locator.registerLazySingleton(
    () => GetCreatebook(locator<RepositoriesDomain>()),
  );
  locator.registerLazySingleton(
    () => GetDeletebook(locator<RepositoriesDomain>()),
  );
  locator.registerLazySingleton(
    () => GetGetbook(locator<RepositoriesDomain>()),
  );
  locator.registerLazySingleton(
    () => GetGetlistbook(locator<RepositoriesDomain>()),
  );

  // Cubit
  locator.registerFactory(() => GetListBookCubit(locator()));
  locator.registerFactory(() => CreateBookCubit(locator()));
  locator.registerFactory(() => DeleteBookCubit(locator()));
}
