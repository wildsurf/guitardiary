import 'package:flutter_test/flutter_test.dart';
import 'package:guitardiary/data/models/skill.dart';

void main() {
  test('it should let you initiate a Skill', () {
    expect(Skill(type: SkillType.repertoire, name: 'Repertoire').toString(),
        'Skill: type=SkillType.repertoire, name=Repertoire');
  });
}
