// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:flutter_test_task/home_page/bloc/home_page_bloc.dart';
import 'home_page/home_page.dart';

final getIt = GetIt.instance;

void main() {
  _initDependencies();

  runApp(const MyApp());
}

void _initDependencies() {
  getIt.registerSingleton<Dio>(
    Dio(BaseOptions(baseUrl: 'https://www.massagebook.com/nxt/pu-api/v1/')),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomePageBloc()),
        ],
        child: const HomePage(),
      ),
    );
  }
}
