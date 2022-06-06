part of 'pizza_bloc.dart';

abstract class PizzaState extends Equatable {
  const PizzaState();

  @override
  List<Object> get props => [];
}

class PizzaInitial extends PizzaState {}

class Pizzaloaded extends PizzaState {
  final List<Pizza> pizzas;

  Pizzaloaded({required this.pizzas});
  @override
  List<Object> get prosp => [pizzas];
}
