import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_hece_okuma/oyun_hece_okuma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(heceOkumaConfig.title.length, 33);
    expect(heceOkumaConfig.tagline.length, 33);
    for (final s in heceOkumaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(heceOkumaConfig.gameId, heceOkumaId);
    expect(heceOkumaRules.gameId, heceOkumaId);
    expect(heceOkumaConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(heceOkumaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: heceOkumaId, optionalMechanics: heceOkumaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(heceOkumaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
