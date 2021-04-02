enum SkillType {
  repertoire,
  technique,
  improvisation,
  knowledge,
  eartraining
}

class Skill {
  final SkillType type;
  final String name;

  Skill({this.type, this.name});

  @override
  String toString() {
    return 'Skill: type=$type, name=$name';
  }
}