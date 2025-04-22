import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterxspringboot/presentation/cubit/get_list_book/get_list_book_cubit.dart';
import 'package:flutterxspringboot/presentation/cubit/create_book/create_book_cubit.dart';
import 'package:flutterxspringboot/presentation/cubit/delete_book/delete_book_cubit.dart';
import 'package:flutterxspringboot/injection.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    context.read<GetListBookCubit>().getListBook();
  }

  void _showCreateBookDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create Book'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: CreateBookCubit.isbn,
                decoration: InputDecoration(labelText: 'ISBN'),
              ),
              TextField(
                controller: CreateBookCubit.title,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: CreateBookCubit.author,
                decoration: InputDecoration(labelText: 'Author'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<CreateBookCubit>().getBookCreate(context).then((
                  _,
                ) {
                  context.read<GetListBookCubit>().getListBook();
                  Navigator.of(context).pop();
                });
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey,
      ),
      body: BlocBuilder<GetListBookCubit, GetListBookState>(
        builder: (context, state) {
          if (state is GetListBookInitial) {
            return Center(child: Text('Loading books...'));
          } else if (state is ListBookLoaded) {
            return SmartRefresher(
              enablePullDown: true,
              onRefresh: () => context.read<GetListBookCubit>()..getRefresh(),
              controller: GetListBookCubit.controller,
              child: ListView.builder(
                itemCount: state.book.length,
                itemBuilder: (context, index) {
                  final book = state.book[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(book.title ?? 'No Title'),
                      subtitle: Text(
                        'Author: ${book.author ?? 'Unknown'} | ISBN: ${book.isbn ?? 'N/A'}',
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          context
                              .read<DeleteBookCubit>()
                              .deleteBook(book.isbn!)
                              .then((_) {
                                context.read<GetListBookCubit>().getListBook();
                              });
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is ListBookError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateBookDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
