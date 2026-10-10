import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

/// Judges `1234 УБ А` by its groups `number`, `suffix` and `serial`.
///
/// Four digits (leading zeroes kept), a two-letter aimag suffix from the
/// article's table ([MongoliaAlphabets.suffixes]) and one further Cyrillic
/// letter. Gated on the serial, so nothing is reported until the plate is
/// complete. Reports, never bars a keystroke.
class MongoliaValidator extends GatedPlateValidator {
  const MongoliaValidator();

  @override
  String get gateGroup => 'serial';

  static const String reasonNumber = 'The number is four digits.';
  static const String reasonSuffix = 'The aimag suffix is not a known one.';
  static const String reasonSerial = 'The serial is one Cyrillic letter.';

  @override
  PlateValidation judge(PlateEntry entry) {
    if (!isDigitsOfLength(entry.group('number'), 4)) {
      return const PlateValidation.invalid(reasonNumber);
    }
    if (!MongoliaAlphabets.suffixes.contains(entry.group('suffix'))) {
      return const PlateValidation.invalid(reasonSuffix);
    }
    if (!MongoliaAlphabets.letters.characters.contains(entry.group('serial'))) {
      return const PlateValidation.invalid(reasonSerial);
    }
    return const PlateValidation.valid();
  }
}
