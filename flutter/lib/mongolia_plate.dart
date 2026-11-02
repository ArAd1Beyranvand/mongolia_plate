/// Mongolia's licence plates for the `plate_core` library.
///
/// The black-on-white one-row and two-row plates with the red Soyombo, a
/// Cyrillic alphabet and an advisory validator.
library;

// TODO(py): [D5] one module `plates.countries.mongolia`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/mongolia`; tree-shakable.
// TODO(kt): [D5] package `countries.mongolia` in the countries module.
export 'package:plate_alphabet/plate_alphabet.dart' show MongoliaAlphabets;
export 'src/mongolia_colors.dart';
export 'src/mongolia_country.dart';
export 'src/mongolia_plates.dart';
export 'src/mongolia_regions.dart';
export 'src/mongolia_themes.dart';
export 'src/mongolia_validators.dart';
