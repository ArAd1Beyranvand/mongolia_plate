import 'package:plate_core/plate_core.dart';

/// Locates a Mongolian plate from the first two letters of its suffix.
///
/// Source: the suffix table of
/// https://en.wikipedia.org/wiki/Vehicle_registration_plates_of_Mongolia
/// The article types some codes with Latin lookalikes (`БH`, `БP`, `OP`);
/// they are read as the Cyrillic letters the plate's alphabet has.
abstract final class MongoliaRegions {
  static const Map<String, String> _aimags = <String, String>{
    'АР': 'Arkhangai',
    'БН': 'Bayankhongor',
    'БР': 'Baganuur, Ulaanbaatar',
    'БӨ': 'Bayan-Ölgii',
    'БУ': 'Bulgan',
    'ГА': 'Govi-Altay',
    'ГС': 'Govisumber',
    'ДА': 'Darkhan-Uul',
    'ДГ': 'Dornogovi',
    'ДО': 'Dornod',
    'ДУ': 'Dundgovi',
    'ОР': 'Orkhon',
    'ХЭ': 'Khentii',
    'ХО': 'Khovd',
    'ХӨ': 'Khövsgöl',
    'НА': 'Nalaikh, Ulaanbaatar',
    'ӨМ': 'Ömnögovi',
    'ӨВ': 'Övörkhangai',
    'СЭ': 'Selenge',
    'СҮ': 'Sükhbaatar',
    'СБ': 'Sükhbaatar city, Selenge',
    'ТӨ': 'Töv',
    'УБ': 'Ulaanbaatar',
    'УН': 'Ulaanbaatar',
    'УА': 'Ulaanbaatar',
    'УЕ': 'Ulaanbaatar',
    'УК': 'Ulaanbaatar',
    'УВ': 'Uvs',
    'ЗА': 'Zavkhan',
  };

  /// The aimag of [suffix] (one or two letters), or null when it matches no
  /// code or several (`Б` is four aimags, `У` is Ulaanbaatar or Uvs).
  static String? lookup(String suffix) {
    if (suffix.isEmpty) return null;
    final Set<String> names = <String>{
      for (final MapEntry<String, String> e in _aimags.entries)
        if (e.key.startsWith(suffix)) e.value,
    };
    return names.length == 1 ? names.single : null;
  }

  /// A [PlateLabelResolver] for [PlateSpec.resolveRegion].
  static String? captionOf(String Function(String key) group) =>
      lookup(group('suffix'));
}
