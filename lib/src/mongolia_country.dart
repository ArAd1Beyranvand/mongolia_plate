import 'package:plate_core/plate_core.dart';

import 'mongolia_colors.dart';

/// Mongolia as a `PlateCountry`. There is no country panel: the Soyombo and
/// `MNG` are placed by the spec; this carries the flag for hosts that list
/// countries.
abstract final class MongoliaCountry {
  static const PlateCountry mongolia = PlateCountry(
    code: 'mn',
    captionLines: <String>[],
    panelColor: MongoliaColors.soyomboRed,
    panelTextColor: MongoliaColors.white,
    flagAspectRatio: 2,
    flag: SvgPlateAsset(
      // Commons: File:Flag_of_Mongolia.svg
      'assets/icons/mongolia_flag.svg',
      package: 'mongolia_plate',
    ),
  );
}
