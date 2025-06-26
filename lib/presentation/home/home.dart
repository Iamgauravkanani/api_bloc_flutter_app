import 'package:bloc_pattern_app/bloc/quotes/quote_bloc.dart';
import 'package:bloc_pattern_app/bloc/quotes/quote_events.dart';
import 'package:bloc_pattern_app/bloc/quotes/quote_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QuoteBloc>().add(FetchQuote());
    },);
    return Scaffold(
      appBar: AppBar(title: Text("Quotes Data"),),
      body: BlocBuilder<QuoteBloc,QuoteState>(builder:(context, state) {
        if(state is QuoteLoading){
          return Center(child: CircularProgressIndicator(),);
        }else if(state is QuoteError){
          return Center(child: Text(state.message),);
        }else if(state is QuoteLoaded){
          return ListView.builder(
            itemCount: state.quotes.length,
            itemBuilder: (context, index) {
            return ListTile(
              leading: Text("${state.quotes[index].id}"),
              title: Text("${state.quotes[index].author}"),
              subtitle: Text("${state.quotes[index].quote}"),
            );
          },);
        }
      return Center(child: Text("No Data"));
      }, ),
    );
  }
}
