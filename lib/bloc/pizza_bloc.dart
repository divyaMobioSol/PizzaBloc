import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_builder/models/pizza_model.dart';
import 'package:equatable/equatable.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(PizzaInitial()) {
    on<LoadPizzaCounter>((event, emit) async {
      await Future<void>.delayed(Duration(seconds: 3));
      emit(Pizzaloaded(pizzas: <Pizza>[]));
      // TODO: implement event handler
    });

    on<AddPizza>((event, emit) {
      if (state is Pizzaloaded) {
        final state = this.state as Pizzaloaded;
        emit(Pizzaloaded(pizzas: List.from(state.pizzas)..add(event.pizza)));
      }
    });

    on<RemovePizza>((event, emit) {
      if (state is Pizzaloaded) {
        final state = this.state as Pizzaloaded;
        emit(Pizzaloaded(pizzas: List.from(state.pizzas)..remove(event.pizza)));
      }
    });
  }
}
