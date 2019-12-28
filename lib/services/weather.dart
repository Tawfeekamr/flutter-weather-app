import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '9504624724fba40b160c8aa2a5844041';
const openMapWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {

    NetworkingHelper networkingHelper = NetworkingHelper('$openMapWeatherURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkingHelper.GetData();

    return weatherData;
  }



    Future<dynamic> getLocationWeather() async {

      Location location = Location();
      await location.getCurrentLocation();

      NetworkingHelper networkingHelper = NetworkingHelper('$openMapWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
      var watherData = await networkingHelper.GetData();

      return watherData;
    }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
