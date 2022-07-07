import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';


class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CounterCubit();
      },
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
        },
        builder: (context, state) {

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      CounterCubit.get(context).decrement();
                    },
                    child: const Icon(
                      FontAwesomeIcons.minus,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    '${CounterCubit.get(context)
                        .counter}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      CounterCubit.get(context).increment();
                    },
                    child: const Icon(
                      FontAwesomeIcons.plus,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}