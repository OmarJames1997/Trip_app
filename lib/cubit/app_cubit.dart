import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_app_cubit/cubit/app_states.dart';
import 'package:trip_app_cubit/model/data_model.dart';
import 'package:trip_app_cubit/services/data_services.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit({required this.data}):super(AppInitialState()){
    emit(AppWelcomeState());
  }
  // This Method is to call any method of the cubit by its name
static AppCubit get(BuildContext context)=>BlocProvider.of(context);

  // declaring DataService
  final DataServices data;
  late final places;

  void getData()async{
    try{
      emit(LoadingState());
      places= await data.getInfo();
      emit(LoadedState(places));

    }catch(e){
    print(e);
    }
  }

  detailPage(DataModel data){
    emit(DetailState(data));
  }

  goHome(){
    emit(LoadedState(places));
  }

}