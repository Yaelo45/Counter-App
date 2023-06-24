import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(ContaDos());
}

class ContaDos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: CounterScreen(),
      ),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    emit(state + 1);

    if (state == 15) {
      Fluttertoast.showToast(
        msg: 'Contador',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
  }

  void reset() {
    emit(0);
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Super contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: TextStyle(fontSize: 48),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              child: Text('Aumentar'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<CounterCubit>().reset();
              },
              child: Text('desde 0'),
            ),
          ],
        ),
      ),
    );
  }
}
