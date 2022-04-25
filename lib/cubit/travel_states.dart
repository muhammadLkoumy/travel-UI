abstract class TravelStates {}

class TravelInitState extends TravelStates {}

class GetDataSuccessState extends TravelStates {}
class GetDataErrorState extends TravelStates {
  final String error;

  GetDataErrorState(this.error);
}
class GetDataLoadingState extends TravelStates {}
