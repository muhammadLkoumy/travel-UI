import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/travel_states.dart';
import 'package:travel_app/helper/dio_helper.dart';
import 'package:travel_app/models/places_model.dart';

class TravelCubit extends Cubit<TravelStates> {
  TravelCubit() : super(TravelInitState());

  static TravelCubit get(context) => BlocProvider.of(context);

  PlacesModel? placesModel;
  List<PlacesModel> places = [];


  void getData() {
    DioHelper.getData(url: "getplaces").then((value) {
      value.data.forEach((place){
        places.add(PlacesModel.fromJson(place));
      });
      print(places[4].name);
      emit(GetDataSuccessState());
    }).catchError((error){
      print(error);
      emit(GetDataErrorState(error.toString()));
    });

  }

}