import 'package:guitardiary/data/models/skill.dart';

class SkillsRepository {
  final List<Skill> _skills;

  SkillsRepository()
      : _skills = [
    Skill(type: SkillType.repertoire, name: 'Repertoire'),
    Skill(type: SkillType.technique, name: 'Technique'),
    Skill(type: SkillType.improvisation, name: 'Improvisation'),
    Skill(type: SkillType.knowledge, name: 'Knowledge'),
    Skill(type: SkillType.eartraining, name: 'Ear Training')
  ];

  List<Skill> get skills {
    return _skills;
  }
}


void main() {
  print(SkillsRepository().skills);
}