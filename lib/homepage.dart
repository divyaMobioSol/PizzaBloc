import 'dart:math';
import 'package:bloc_builder/bloc/pizza_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'models/pizza_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PizzaBloc, PizzaState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton:
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            FloatingActionButton(
              onPressed: () {
                late Pizza pizza;
                if (state is Pizzaloaded) {
                  pizza = state.pizzas[0];
                }
                BlocProvider.of<PizzaBloc>(context).add(AddPizza(
                  pizza: pizza,
                ));
                print('yes pressed');
              },
              child: const Icon(
                Icons.local_pizza_rounded,
                color: Colors.amber,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                late Pizza pizza;
                if (state is Pizzaloaded) {
                  pizza = state.pizzas[1];
                }
                BlocProvider.of<PizzaBloc>(context).add(AddPizza(
                  pizza: pizza,
                ));
              },
              child: const Icon(
                Icons.local_pizza,
                color: Colors.pink,
              ),
            ),
            FloatingActionButton(
                onPressed: () {
                  late Pizza pizza;
                  if (state is Pizzaloaded) {
                    pizza = state.pizzas[0];
                  }
                  BlocProvider.of<PizzaBloc>(context)
                      .add(RemovePizza(pizza: pizza));
                },
                child: const Icon(
                  Icons.local_pizza_rounded,
                  color: Colors.black,
                )),
            FloatingActionButton(
              onPressed: () {
                late Pizza pizza;
                if (state is Pizzaloaded) {
                  pizza = state.pizzas[1];
                }
                BlocProvider.of<PizzaBloc>(context)
                    .add(RemovePizza(pizza: pizza));
              },
              child: const Icon(Icons.local_pizza_sharp),
            )
          ]),
          appBar: AppBar(title: Text('Pizza')),
          body: Center(child: BlocBuilder<PizzaBloc, PizzaState>(
            builder: (context, state) {
              if (state is PizzaInitial) {
                return CircularProgressIndicator();
              }

              if (state is Pizzaloaded) {
                return Column(
                  children: [
                    Text(state.pizzas.length.toString()),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            for (int index = 0;
                                index < state.pizzas.length;
                                index++)
                              Positioned(
                                  left: Random().nextInt(250).toDouble(),
                                  top: Random().nextInt(400).toDouble(),
                                  child: SizedBox(
                                    height: 150,
                                    width: 150,
                                    child:
                                        Image.asset(state.pizzas[index].image),
                                  ))
                          ]),
                    )
                  ],
                );
              } else {
                return Text('Something went wrong');
              }
            },
          )),
        );
      },
    );
  }
}
