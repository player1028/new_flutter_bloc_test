import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_one/cubit/counter_cubit.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: MyHomePage(),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        if(state.wasIncremented){
          final snackBar = SnackBar(
              content: Text('Incremened'),
            duration: Duration(milliseconds: 600),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          final snackBar = SnackBar(
            content: Text('Decremened'),
            duration: Duration(milliseconds: 600),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            }, icon: Icon(Icons.add)),
            IconButton(onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            }, icon: Icon(Icons.remove)),
            SizedBox(height: 100,)
          ],
        ),
        body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                '${state.count}', style: TextStyle(
                  fontSize: 33
              ),
              );
            },
          ),
        ),
      ),
    );
  }
}
