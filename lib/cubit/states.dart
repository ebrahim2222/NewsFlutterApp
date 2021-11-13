abstract class NewsStates {}

class NewsInitialStates extends NewsStates {}

class BottomNavStates extends NewsStates{}

class getBusinessLoadingState extends NewsStates{}

class getBusinessSuccessState extends NewsStates{}

class getBusinessErrorState extends NewsStates{
  final String? error;
  getBusinessErrorState({this.error});
}

class getSportsLoadingState extends NewsStates{}

class getSportsSuccessState extends NewsStates{}

class getSportsErrorState extends NewsStates{
  final String? error;
  getSportsErrorState({this.error});
}
class getScinceLoadingState extends NewsStates{}

class getScinceSuccessState extends NewsStates{}

class getScinceErrorState extends NewsStates{
  final String? error;
  getScinceErrorState({this.error});
}

class changeModeState extends NewsStates{}

class getSearchLoadingState extends NewsStates{}

class getSearchSuccessState extends NewsStates{}

class getSearchErrorState extends NewsStates{
  final String? error;
  getSearchErrorState({this.error});
}
