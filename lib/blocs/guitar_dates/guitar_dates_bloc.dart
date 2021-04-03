import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guitardiary/data/models/guitar_date.dart';
import 'package:guitardiary/data/repositories/guitar_dates_repository.dart';
import 'package:meta/meta.dart';

part 'guitar_dates_event.dart';

part 'guitar_dates_state.dart';

class GuitarDatesBloc extends Bloc<GuitarDatesEvent, GuitarDatesState> {
  final GuitarDatesRepository guitarDatesRepository;

  GuitarDatesBloc({@required this.guitarDatesRepository})
      : super(GuitarDatesLoadInProgress());

  @override
  Stream<GuitarDatesState> mapEventToState(
    GuitarDatesEvent event,
  ) async* {
    if (event is GuitarDatesTimeRangeUpdates) {
      yield* _mapGuitarDatesTimeRangeUpdatesToState(event);
    } else if (event is GuitarDatesAdded) {
      yield* _mapGuitarDatesAddedToState(event);
    }
  }

  Stream<GuitarDatesState> _mapGuitarDatesTimeRangeUpdatesToState(
      GuitarDatesTimeRangeUpdates event) async* {
    try {
      final guitarDates =
          await this.guitarDatesRepository.getGuitarDates(event.from, event.to);
      yield GuitarDatesLoadSuccess(
        guitarDates: guitarDates,
      );
    } catch (_) {
      yield GuitarDatesLoadFailure();
    }
  }

  Stream<GuitarDatesState> _mapGuitarDatesAddedToState(
      GuitarDatesAdded event) async* {
    if (state is GuitarDatesLoadSuccess) {
      final List<GuitarDate> updatedGuitarDates =
          List.from((state as GuitarDatesLoadSuccess).guitarDates)
            ..add(event.guitarDate);
      await this.guitarDatesRepository.insert(event.guitarDate);
      yield GuitarDatesLoadSuccess(guitarDates: updatedGuitarDates);
    }
  }
}
