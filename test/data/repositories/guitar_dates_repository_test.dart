import 'package:flutter_test/flutter_test.dart';
import 'package:guitardiary/data/models/guitar_date.dart';
import 'package:guitardiary/data/models/skill.dart';
import 'package:guitardiary/data/repositories/guitar_dates_repository.dart';
import 'package:guitardiary/data/services/sqlite_database_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'guitar_dates_repository_test.mocks.dart';

@GenerateMocks([DatabaseService])
void main() {
  SqliteGuitarDatesRepository repo;
  DatabaseService service;

  setUp(() {
    service = MockDatabaseService();
    repo = SqliteGuitarDatesRepository(service);
  });

  test('should return GuitarDates when there is a result', () async {
    final from = DateTime.parse('2020-12-01');
    final to = DateTime.parse('2020-12-31');

    when(service.query('GuitarDatesTable', 'date BETWEEN ? AND ?', [
      from.millisecondsSinceEpoch,
      to.millisecondsSinceEpoch
    ])).thenAnswer((_) => Future.value([
          {
            'id': 1,
            'date': 1325458800000,
            'duration': 20,
            'repertoireTime': 10,
            'techniqueTime': null,
            'improvisationTime': null,
            'knowledgeTime': null,
            'eartrainingTime': null
          }
        ]));

    List<GuitarDate> guitarDates = await repo.getGuitarDates(from, to);

    expect(guitarDates.length, 1);
    expect(guitarDates.first.id, 1);
    expect(guitarDates.first.date, DateTime.parse('2012-01-02'));
    expect(guitarDates.first.duration, 20);
    expect(guitarDates.first.skillTimes[SkillType.repertoire], 10);
    expect(guitarDates.first.skillTimes[SkillType.knowledge], 0);
  });

  test('should insert a GuitarDate', () async {
    final GuitarDate guitarDate = GuitarDate(
        date: DateTime.parse('2012-01-02'),
        duration: 20,
        skillTimes: {
          SkillType.repertoire: 10,
          SkillType.technique: 0,
          SkillType.eartraining: 0,
          SkillType.knowledge: 0,
          SkillType.improvisation: 0
        });

    when(service.insert('GuitarDatesTable', {
      'date': 1325458800000,
      'duration': 20,
      'repertoireTime': 10,
      'techniqueTime': 0,
      'improvisationTime': 0,
      'knowledgeTime': 0,
      'eartrainingTime': 0
    })).thenAnswer((_) => Future.value(11));

    await repo.insert(guitarDate);
  });
}
