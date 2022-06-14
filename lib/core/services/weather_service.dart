import 'package:weather_app/core/config/env.dart';
import 'package:weather_app/core/helpers/api_base.dart';

class WeatherService extends ApiBaseHelper {
  final _baseUrl = Env.baseURL;
  ApiBaseHelper api = ApiBaseHelper();

  weather({
    required String lat,
    required String long,
    required String units,
  }) async {
    final response = await api.getHTTP(
      _baseUrl +
          '/onecall?lat=' +
          lat +
          '&lon=' +
          long +
          '&units=' +
          units +
          '&mode=json&exclude=minutely&appid=' +
          Env.token,
    );

    return response;
  }
}
