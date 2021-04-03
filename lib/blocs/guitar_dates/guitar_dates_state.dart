part of 'guitar_dates_bloc.dart';

@immutable
abstract class GuitarDatesState extends Equatable {
  @override
  List<Object> get props => [];
}

class GuitarDatesLoadInProgress extends GuitarDatesState {
  final String loadingMessage;

  GuitarDatesLoadInProgress({this.loadingMessage = ''});
}

class GuitarDatesLoadSuccess extends GuitarDatesState {
  final List<GuitarDate> guitarDates;

  GuitarDatesLoadSuccess({this.guitarDates = const []});

  @override
  List<Object> get props => [guitarDates];

  @override
  String toString() {
    return 'GuitarDatesLoadSucces: guitarDates=$guitarDates';
  }
}

class GuitarDatesLoadFailure extends GuitarDatesState {}
