import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Screens/Search/bloc/search_states.dart';
import 'package:shop/Screens/Search/search_model.dart';
import 'package:shop/data/api/dio_helper.dart';
import 'package:shop/shared/network/end_point.dart';

class SearchBloc extends Cubit<SearchStates> {
  SearchBloc() : super(SearchInitialState());

  static SearchBloc get(context) => BlocProvider.of(context);
  bool isDark = false;
  bool isRtl = true;
  SearchModel model;

  void getSearch(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCHURL,
      token: token,
      data: {'text': text},
    ).then((value) {
      model = SearchModel.fromJson(value.data);
      emit(SearchSucessState());
    }).catchError((error) {
      emit(SearchErrorState());
      print(error.toString());
    });
  }
}
