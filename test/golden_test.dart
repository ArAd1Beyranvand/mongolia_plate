import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mongolia_plate/mongolia_plate.dart';
import 'package:plate_core/plate_core.dart';

/// One golden per category, drawn with real bold faces so the ink can be
/// measured against the references (`platekit golden-check`).
///
/// Regenerate with `flutter test --update-goldens` after a deliberate change.
void main() {
  setUpAll(() async {
    final FontLoader loader = FontLoader('Roboto');
    for (final String path in const <String>[
      '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
    ]) {
      final File face = File(path);
      if (!face.existsSync()) continue;
      loader.addFont(face.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  /// category id -> (spec, theme, space-separated sample value)
  final Map<String, (PlateSpec, PlateTheme, String)> cases =
      <String, (PlateSpec, PlateTheme, String)>{
        'private': (
          MongoliaPlates.private,
          MongoliaThemes.private,
          '1 2 3 4 У Б А',
        ),
        'two_row': (
          MongoliaPlates.twoRow,
          MongoliaThemes.twoRow,
          '1 2 3 4 У Б А',
        ),
      };

  for (final MapEntry<String, (PlateSpec, PlateTheme, String)> c
      in cases.entries) {
    testWidgets(c.key, (tester) async {
      final (PlateSpec spec, PlateTheme theme, String values) = c.value;
      final PlateController controller = PlateController.fromValues(
        spec,
        values.split(' '),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 680,
                height: 300,
                child: PlateThemeScope(
                  theme: theme,
                  child: PlateView(
                    controller: controller,
                    theme: theme,
                    country: MongoliaCountry.mongolia,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      // The decal's PNG decodes outside the fake clock; give it real time.
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 200)),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(PlateView),
        matchesGoldenFile('goldens/mn_${c.key}.png'),
      );
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
