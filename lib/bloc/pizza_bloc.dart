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
      List<Pizza> pizzass = [
        const Pizza(id: '1', image: 'assets/pizza.jpg', name: 'my pizza'),
        const Pizza(id: '2', image: 'assets/pizza1.jpg', name: 'my new pizza')
      ];
      emit(Pizzaloaded(pizzas: pizzass));
    });

    on<AddPizza>((event, emit) {
      final PizzaState currentState = state;
      List<Pizza> oldpizzas = [];
      if (currentState is Pizzaloaded) {
        oldpizzas = currentState.pizzas;
      }
      oldpizzas.add(event.pizza);
      emit(Pizzaloaded(pizzas: oldpizzas));
    });

    on<RemovePizza>((event, emit) {
      if (state is Pizzaloaded) {
        final state = this.state as Pizzaloaded;
        emit(Pizzaloaded(pizzas: List.from(state.pizzas)..remove(event.pizza)));
      }
    });
  }
}
