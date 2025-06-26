import 'package:bloc_pattern_app/data/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'quote_events.dart';
import 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc() : super(QuoteInitial()){
    on<FetchQuote>((event, emit) async {
      emit(QuoteLoading());
      try{
        final quotes = await ApiService.apiService.fetchQuotes();
        emit(QuoteLoaded(quotes ?? []));
      }catch(e){
        emit(QuoteError(e.toString()));
      }
    });
  }
}