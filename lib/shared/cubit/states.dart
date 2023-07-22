abstract class WeatherStates {}

class InitialWeatherState extends WeatherStates{}


class WeatherSuccessStates extends WeatherStates{}
class WeatherLoadingStates extends WeatherStates{}
class WeatherErrorStates extends WeatherStates{
  final String error;

  WeatherErrorStates(this.error);
}