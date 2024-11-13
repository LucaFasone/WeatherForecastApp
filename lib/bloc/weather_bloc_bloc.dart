import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FeatchWeather>((event, emit) async {
      await _featchWeatherData(event.position, emit);
    });

    on<RefreshWeather>((event, emit) async {
      await _featchWeatherData(event.position, emit);
    });
  }

  Future<void> _featchWeatherData(
      Position position, Emitter<WeatherBlocState> emit) async {
    try {
      WeatherFactory wf = WeatherFactory("API_KEY", language: Language.ENGLISH);
      Weather weather = await wf.currentWeatherByLocation(
        position.latitude,
        position.longitude,
      );
      emit(WeatherBlocSucces(weather));
    } catch (e) {
      emit(WeatherBlocFailure());
    }
  }
}
