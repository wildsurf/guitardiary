import 'package:flutter/cupertino.dart';

import 'skill.dart';

const defaultSkillTimes = {
  SkillType.repertoire: 0,
  SkillType.technique: 0,
  SkillType.eartraining: 0,
  SkillType.knowledge: 0,
  SkillType.improvisation: 0
};

class GuitarDate {
  final int id;
  final DateTime date;

  /// duration is total duration in minutes
  final int duration;

  /// skill times are in minutes
  final Map<SkillType, int> skillTimes;

  GuitarDate(
      {this.id = -1,
      @required this.date,
      this.duration = 0,
      this.skillTimes = defaultSkillTimes});

  @override
  String toString() {
    return 'GuitarDate: id=$id, date=$date, duration=$duration, skillTimes=$skillTimes';
  }
}
