import 'package:flutter_test/flutter_test.dart';
import 'package:guitardiary/data/models/guitar_date.dart';
import 'package:guitardiary/data/models/skill.dart';

void main() {
  test('it should let you instantiate a guitar with only a date', () {
    GuitarDate guitarDate = GuitarDate(
      date: DateTime.parse('2012-02-27'),
    );

    expect(guitarDate.id, -1);
    expect(guitarDate.date, DateTime.parse('2012-02-27'));
    expect(guitarDate.duration, 0);
    expect(guitarDate.skillTimes, {
      SkillType.repertoire: 0,
      SkillType.technique: 0,
      SkillType.eartraining: 0,
      SkillType.knowledge: 0,
      SkillType.improvisation: 0
    });
  });

  test('it should let you instantiate a guitar date with all data', () {
    GuitarDate guitarDate = GuitarDate(
        id: 123,
        date: DateTime.parse('2012-02-27'),
        duration: 150,
        skillTimes: {
          SkillType.repertoire: 10,
          SkillType.technique: 20,
          SkillType.eartraining: 30,
          SkillType.knowledge: 40,
          SkillType.improvisation: 50
        });

    expect(guitarDate.id, 123);
    expect(guitarDate.date, DateTime.parse('2012-02-27'));
    expect(guitarDate.duration, 150);
    expect(guitarDate.skillTimes, {
      SkillType.repertoire: 10,
      SkillType.technique: 20,
      SkillType.eartraining: 30,
      SkillType.knowledge: 40,
      SkillType.improvisation: 50
    });
  });
}
