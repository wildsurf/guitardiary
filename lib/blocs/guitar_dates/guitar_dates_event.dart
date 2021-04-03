part of 'guitar_dates_bloc.dart';

@immutable
abstract class GuitarDatesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GuitarDatesTimeRangeUpdates extends GuitarDatesEvent {
  final DateTime from;
  final DateTime to;

  GuitarDatesTimeRangeUpdates({this.from, this.to});

  @override
  List<Object> get props => [from, to];
}

class GuitarDatesAdded extends GuitarDatesEvent {
  final GuitarDate guitarDate;

  GuitarDatesAdded({this.guitarDate});

  @override
  List<Object> get props => [guitarDate];

  @override
  String toString() {
    return 'GuitarDatesAdded: guitarDate=$guitarDate';
  }
}
