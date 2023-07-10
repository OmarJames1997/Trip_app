import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app_cubit/cubit/app_cubit.dart';
import 'package:trip_app_cubit/cubit/app_cubit_logics.dart';
import 'package:trip_app_cubit/details_page.dart';
import 'package:trip_app_cubit/presentation/screens/welcome/welcome_page.dart';
import 'package:trip_app_cubit/services/data_services.dart';

import 'presentation/screens/navPages/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      home: BlocProvider<AppCubit>(
        create: (context) => AppCubit(
          data: DataServices(),
        ),
        child: AppCubitLogics(),

      )
    );
  }
}

