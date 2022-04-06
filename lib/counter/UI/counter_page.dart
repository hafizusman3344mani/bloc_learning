import 'package:bloc_learning/counter/UI/other_page.dart';
import 'package:bloc_learning/counter/cubits/counter/counter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  final String title;
  const CounterPage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.counter == 3) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('Counter is ${state.counter}'),
                  );
                });
          } else if (state.counter < 0) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => OtherPage()));
          }
        },
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${state.counter}',
                    style: const TextStyle(fontSize: 40),
                  ),
                  IconButton(
                      onPressed: () {
                        if (state.isFavorite) {
                          BlocProvider.of<CounterCubit>(context).unFavorite();
                        } else {
                          BlocProvider.of<CounterCubit>(context).favorite();
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: state.isFavorite ? Colors.red : Colors.grey,
                      )),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
            child: const Icon(Icons.add),
            heroTag: 'Increment',
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            child: const Icon(Icons.remove),
            heroTag: 'Decrement',
          ),
        ],
      ),
    );
  }
}
