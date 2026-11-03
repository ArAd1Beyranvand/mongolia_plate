import 'package:mongolia_plate/mongolia_plate.dart';
import 'package:plate_core/testing.dart';

void main() {
  plateGoldens('mn', MongoliaCountry.mongolia, <String, PlateGoldenCase>{
    'private': (MongoliaPlates.private, MongoliaThemes.private, '1234 УБ А'),
    'two_row': (MongoliaPlates.twoRow, MongoliaThemes.twoRow, '1234 УБ А'),
  }, decodeDelay: const Duration(milliseconds: 200));
}
