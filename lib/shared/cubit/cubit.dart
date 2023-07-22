import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/shared/cubit/states.dart';

import '../../models/weather_model.dart';
import '../dio/dio_helper.dart';

class WeatherCubit extends Cubit<WeatherStates>
{
  WeatherCubit() : super(InitialWeatherState());

  static WeatherCubit get(context)=>BlocProvider.of(context);

  String? cityName;

  WeatherModel? weatherModel;
  List<dynamic> weather=[];
  void getWeather({
   required String cityName,
})
  {
    emit(WeatherLoadingStates());
    DioHelper.getData(
        url: 'v1/forecast.json',
        query: {
      'key':'4effb3d470f14c4fa46125058231704',
      'q':cityName,
      'aqi':'no',
    }).then((value)
    {
      weatherModel=WeatherModel.fromJson(value.data);
      print(weatherModel!.current!.condition);
      print(weatherModel!.location!.name);
      print(weatherModel!.forecast);
      emit(WeatherSuccessStates());
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(WeatherErrorStates(error.toString()));
    }
    );
  }
}