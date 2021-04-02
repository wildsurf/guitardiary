import 'package:guitardiary/data/models/guitar_date.dart';
import 'package:guitardiary/data/models/skill.dart';
import 'package:guitardiary/data/services/sqlite_database_service.dart';

abstract class GuitarDatesRepository {
  Future<void> insert(GuitarDate guitarDate);

  Future<GuitarDate> update(GuitarDate guitarDate);

  Future<GuitarDate> delete(GuitarDate guitarDate);

  Future<List<GuitarDate>> getGuitarDates(DateTime from, DateTime to);
}

final GuitarDatesTable = 'GuitarDatesTable';

const String guitarDateTableKeysId = 'id';
const String guitarDateTableKeysDate = 'date';
const String guitarDateTableKeysDuration = 'duration';
const String guitarDateTableKeysRepertoireTime = 'repertoireTime';
const String guitarDateTableKeysTechniqueTime = 'techniqueTime';
const String guitarDateTableKeysImprovisationTime = 'improvisationTime';
const String guitarDateTableKeysKnowledgeTime = 'knowledgeTime';
const String guitarDateTableKeysEartrainingTime = 'eartrainingTime';

class SqliteGuitarDatesRepository implements GuitarDatesRepository {
  final DatabaseService databaseService;

  SqliteGuitarDatesRepository(this.databaseService);

  @override
  Future<GuitarDate> delete(GuitarDate guitarDate) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<GuitarDate>> getGuitarDates(DateTime from, DateTime to) async {
    const where = '$guitarDateTableKeysDate BETWEEN ? AND ?';
    final whereArgs = [from.millisecondsSinceEpoch, to.millisecondsSinceEpoch];
    final result =
        await databaseService.query(GuitarDatesTable, where, whereArgs);

    return result
        .map((row) => GuitarDate(
                id: row[guitarDateTableKeysId],
                date: DateTime.fromMillisecondsSinceEpoch(
                    row[guitarDateTableKeysDate]),
                duration: row[guitarDateTableKeysDuration],
                skillTimes: {
                  SkillType.repertoire:
                      row[guitarDateTableKeysRepertoireTime] ?? 0,
                  SkillType.technique:
                      row[guitarDateTableKeysTechniqueTime] ?? 0,
                  SkillType.eartraining:
                      row[guitarDateTableKeysEartrainingTime] ?? 0,
                  SkillType.knowledge:
                      row[guitarDateTableKeysKnowledgeTime] ?? 0,
                  SkillType.improvisation:
                      row[guitarDateTableKeysImprovisationTime] ?? 0,
                }))
        .toList();
  }

  @override
  Future<void> insert(GuitarDate guitarDate) async {
    var row = {
      guitarDateTableKeysDate: guitarDate.date.millisecondsSinceEpoch,
      guitarDateTableKeysDuration: guitarDate.duration,
      guitarDateTableKeysRepertoireTime:
          guitarDate.skillTimes[SkillType.repertoire],
      guitarDateTableKeysTechniqueTime:
          guitarDate.skillTimes[SkillType.technique],
      guitarDateTableKeysImprovisationTime:
          guitarDate.skillTimes[SkillType.improvisation],
      guitarDateTableKeysKnowledgeTime:
          guitarDate.skillTimes[SkillType.knowledge],
      guitarDateTableKeysEartrainingTime:
          guitarDate.skillTimes[SkillType.eartraining],
    };

    await databaseService.insert(GuitarDatesTable, row);
  }

  @override
  Future<GuitarDate> update(GuitarDate guitarDate) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
