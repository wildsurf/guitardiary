import 'package:flutter_test/flutter_test.dart';
import 'package:guitardiary/data/repositories/guitar_dates_repository.dart';
import 'package:guitardiary/data/services/sqlite_database_service.dart';

void main() {
  final String testTable = 'GuitarDate';
  final SqliteDatabaseService databaseService = SqliteDatabaseService();

  TestWidgetsFlutterBinding.ensureInitialized();

  group('SqliteDatabaseService', () {
    tearDownAll(() async {
      databaseService.reset();
    });

    test('Insert and search items', () async {
      const where = '$guitarDateTableKeysDate BETWEEN ? AND ?';
      final whereArgs = [
        DateTime.parse('2012-01-01').millisecondsSinceEpoch,
        DateTime.parse('2020-12-31').millisecondsSinceEpoch
      ];

      // at the beginning database is empty
      expect((await databaseService.query(testTable, where, whereArgs)).isEmpty,
          true);

      // // insert one row
      final row = {
        guitarDateTableKeysDate:
            DateTime.parse('2012-01-02').millisecondsSinceEpoch,
        guitarDateTableKeysDuration: 20,
        guitarDateTableKeysRepertoireTime: 10,
      };

      await databaseService.insert(testTable, row);

      var inRangeResult =
          await databaseService.query(testTable, where, whereArgs);

      expect(inRangeResult.length, 1);
      expect(inRangeResult.first['id'], 1);
      expect(inRangeResult.first['date'], 1325458800000);
      expect(inRangeResult.first['duration'], 20);
      expect(inRangeResult.first['repertoireTime'], 10);

      var outOfRangeResult = await databaseService.query(testTable, where, [
        DateTime.parse('2012-01-03').millisecondsSinceEpoch,
        DateTime.parse('2020-12-31').millisecondsSinceEpoch
      ]);

      expect(outOfRangeResult.isEmpty, true);
    });
  }, skip: true);
}
