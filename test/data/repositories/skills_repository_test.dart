import 'package:flutter_test/flutter_test.dart';
import 'package:guitardiary/data/models/skill.dart';
import 'package:guitardiary/data/repositories/skills_repository.dart';

void main() {
  test('get skills should return a list of skills', () {
    final repo = SkillsRepository();

    expect(repo.skills.length, 5);

    expect(repo.skills[0].name, 'Repertoire');
    expect(repo.skills[0].type, SkillType.repertoire);

    expect(repo.skills[1].name, 'Technique');
    expect(repo.skills[1].type, SkillType.technique);

    expect(repo.skills[2].name, 'Improvisation');
    expect(repo.skills[2].type, SkillType.improvisation);

    expect(repo.skills[3].name, 'Knowledge');
    expect(repo.skills[3].type, SkillType.knowledge);

    expect(repo.skills[4].name, 'Ear Training');
    expect(repo.skills[4].type, SkillType.eartraining);
  });
}
