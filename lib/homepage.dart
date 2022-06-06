import 'dart:math';

import 'package:bloc_builder/bloc/pizza_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/pizza_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(
          onPressed: () {
            context.read<PizzaBloc>().add(AddPizza(
                  pizza: Pizza.pizzas[0],
                ));
          },
          child: Icon(
            Icons.local_pizza_rounded,
            color: Colors.amber,
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<PizzaBloc>().add(AddPizza(
                  pizza: Pizza.pizzas[1],
                ));
          },
          child: Icon(
            Icons.local_pizza,
            color: Colors.pink,
          ),
        ),
        FloatingActionButton(
            onPressed: () {
              context.read<PizzaBloc>().add(RemovePizza(
                    pizza: Pizza.pizzas[0],
                  ));
            },
            child: Icon(
              Icons.local_pizza_rounded,
              color: Colors.black,
            )),
        FloatingActionButton(
          onPressed: () {
            context.read<PizzaBloc>().add(RemovePizza(
                  pizza: Pizza.pizzas[1],
                ));
          },
          child: Icon(Icons.local_pizza_sharp),
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
                SizedBox(
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
                                child: state.pizzas[index].image,
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
  }
}
