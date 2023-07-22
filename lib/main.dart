import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/home_screen.dart';
import 'shared/cubit/cubit.dart';
import 'shared/cubit/states.dart';
import 'shared/dio/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>WeatherCubit())
      ],
      child: BlocConsumer<WeatherCubit,WeatherStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: WeatherCubit.get(context).weatherModel==null?Colors.blue:WeatherCubit.get(context).weatherModel!.getThemeColor()
            ),
            debugShowCheckedModeBanner: false,
            home: const WeatherHomeScreen(),
          );
        },
      ),
    );
  }
}
