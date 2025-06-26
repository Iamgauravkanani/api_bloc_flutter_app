import 'package:bloc_pattern_app/data/model/quote_model.dart';
import 'package:equatable/equatable.dart';

abstract class QuoteState extends Equatable{
  const QuoteState();

  @override
  List<Object?> get props => [];
}

class QuoteInitial extends QuoteState{}

class QuoteLoading extends QuoteState{}

class QuoteLoaded extends QuoteState{
    final List<Quotes> quotes;
    const QuoteLoaded(this.quotes);

    @override
    List<Object?> get props => [quotes];
}

class QuoteError extends QuoteState{
  final String message;
  const QuoteError(this.message);
@override
 List<Object?> get props => [message];
}