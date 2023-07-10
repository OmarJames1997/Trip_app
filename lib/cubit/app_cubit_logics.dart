

// This File checks on the states ( If Statements on on States) And Also Open the Cubit

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app_cubit/cubit/app_cubit.dart';
import 'package:trip_app_cubit/cubit/app_states.dart';
import 'package:trip_app_cubit/details_page.dart';
import 'package:trip_app_cubit/home_page.dart';
import 'package:trip_app_cubit/presentation/screens/navPages/layout.dart';
import 'package:trip_app_cubit/presentation/screens/welcome/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<AppCubit, AppStates>(
        builder:(context, state) {
          if(state is DetailState){
            return const DetailsPage();
          }
        if(state is AppWelcomeState){
          return const WelcomePage();
        }
        if(state is LoadingState){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is LoadedState){
          return LayoutPage();
        }


        else{
          return Container();}
      },),
    );
  }
}
