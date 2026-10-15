import 'package:flutter_test/flutter_test.dart';
import 'package:mongolia_plate/mongolia_plate.dart';
import 'package:plate_core/plate_core.dart';

void main() {
  test('a full suffix names the aimag', () {
    expect(MongoliaRegions.lookup('ТӨ'), 'Töv');
    expect(MongoliaRegions.lookup('СБ'), 'Sükhbaatar city, Selenge');
    expect(MongoliaRegions.lookup('УН'), 'Ulaanbaatar');
    expect(MongoliaRegions.lookup('БР'), 'Baganuur, Ulaanbaatar');
  });

  test('a first letter names the aimag only when unambiguous', () {
    expect(MongoliaRegions.lookup('А'), 'Arkhangai');
    expect(MongoliaRegions.lookup('З'), 'Zavkhan');
    for (final String code in <String>['Б', 'Д', 'У', 'С', 'Х', 'Ө', '']) {
      expect(MongoliaRegions.lookup(code), isNull, reason: code);
    }
  });

  test('unissued codes name nothing', () {
    for (final String code in <String>['АА', 'УЯ', 'Я']) {
      expect(MongoliaRegions.lookup(code), isNull, reason: code);
    }
  });

  test('both plates follow each letter typed and deleted', () {
    for (final PlateSpec spec in MongoliaPlates.all) {
      final PlateController c = PlateController(spec: spec);
      expect(c.regionCaption, isNull);
      c.setGroup('suffix', 'У');
      expect(c.regionCaption, isNull);
      c.setGroup('suffix', 'УВ');
      expect(c.regionCaption, 'Uvs');
      c.setGroup('suffix', 'У');
      expect(c.regionCaption, isNull);
    }
  });
}
