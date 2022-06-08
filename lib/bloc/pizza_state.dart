part of 'pizza_bloc.dart';

abstract class PizzaState {
  const PizzaState();
}

class PizzaInitial extends PizzaState {}

class Pizzaloaded extends PizzaState {
  final List<Pizza> pizzas;

  const Pizzaloaded({required this.pizzas});
}
