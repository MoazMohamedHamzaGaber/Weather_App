import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {

  String? cityName;

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit,WeatherStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit=WeatherCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search a City'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onFieldSubmitted: (data){
                      cityName=data;
                      cubit.getWeather(cityName: cityName!);
                      cubit.cityName=cityName;
                      Navigator.pop(context);
                    },
                    decoration:  const InputDecoration(
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(
                          color: Colors.black45
                      ),
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                      suffixIcon:Icon(Icons.search,),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
