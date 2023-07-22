import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/search_screen.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class WeatherHomeScreen extends StatelessWidget {
  const WeatherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocConsumer<WeatherCubit, WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = WeatherCubit.get(context);
          if (state is WeatherLoadingStates) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is WeatherSuccessStates) {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  cubit.weatherModel!.getThemeColor(),
                  cubit.weatherModel!.getThemeColor()[300]!,
                  cubit.weatherModel!.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    cubit.weatherModel!.location!.name!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'updated at : ${cubit.weatherModel!.location!.localtime!}',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Image(
                          image: AssetImage('assets/images/clear.jpg')),
                      Text(
                        '${cubit.weatherModel!.forecast!.forecastday[0].day!.avgtemp_c}',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'maxTemp :${cubit.weatherModel!.forecast!.forecastday[0].day!.maxtemp_c}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'minTemp : ${cubit.weatherModel!.forecast!.forecastday[0].day!.mintemp_c}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    cubit.weatherModel!.current!.condition!.text!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            );
          }
          else if (state is WeatherErrorStates) {
            return const Center(
              child: Text(
                'ERROR, Please try again',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            );
          }
          else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    child: Text(
                      'there is no weather😔start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
