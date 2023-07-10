import 'package:equatable/equatable.dart';
import 'package:trip_app_cubit/model/data_model.dart';

abstract class AppStates extends Equatable{}

class AppInitialState extends AppStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AppWelcomeState extends AppStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends AppStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends AppStates{
  LoadedState(this.places);
  final List<DataModel> places;

  @override
  // TODO: implement props
  List<Object> get props => [places];
}
class DetailState extends AppStates{
  DetailState(this.place);
  final DataModel place;

  @override
  // TODO: implement props
  List<Object> get props => [place];
}