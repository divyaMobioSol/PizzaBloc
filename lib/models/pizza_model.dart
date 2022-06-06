import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pizza extends Equatable {
  final String id;
  final String name;
  final Image image;

  const Pizza({required this.id, required this.image, required this.name});

  @override
  List<Object?> get pros => [id, name, image];

  static List<Pizza> pizzas = [
    Pizza(id: '0', name: 'chitti', image: Image.asset('assets/pizza.jpg')),
    Pizza(id: '1', name: 'macha', image: Image.asset('assets/pizza1.jpg')),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
