import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterxspringboot/injection.dart';
import 'package:flutterxspringboot/presentation/cubit/create_book/create_book_cubit.dart';
import 'package:flutterxspringboot/presentation/cubit/delete_book/delete_book_cubit.dart';
import 'package:flutterxspringboot/presentation/cubit/get_list_book/get_list_book_cubit.dart';
import 'package:flutterxspringboot/presentation/pages/homepage.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetListBookCubit>(
          create: (context) => locator<GetListBookCubit>(),
        ),
        BlocProvider<CreateBookCubit>(
          create: (context) => locator<CreateBookCubit>(),
        ),
        BlocProvider<DeleteBookCubit>(
          create: (context) => locator<DeleteBookCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const Homepage(),
      ),
    );
  }
}
