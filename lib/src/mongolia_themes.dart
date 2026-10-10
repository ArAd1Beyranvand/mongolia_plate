import 'package:plate_core/plate_core.dart';

import 'mongolia_colors.dart';

/// Black on white. The frame is about 3.75 thick (x 1.25–5 of 520) with a
/// corner radius near 7, measured off `.plateref/mn/flat_Plak_Mo_olistan_2001.png`.
/// The ratios are of the plate height, so each design passes its own.
abstract final class MongoliaThemes {
  /// The one-row plate, 520 × 110.
  static final PlateTheme private = PlateTheme.monochrome(
    field: MongoliaColors.white,
    ink: MongoliaColors.black,
    inactive: MongoliaColors.inactive,
    borderWidthRatio: 3.75 / 110,
    plateRadiusRatio: 7 / 110,
  );

  /// The two-row plate, 300 × 170: the same frame in absolute terms.
  static final PlateTheme twoRow = PlateTheme.monochrome(
    field: MongoliaColors.white,
    ink: MongoliaColors.black,
    inactive: MongoliaColors.inactive,
    borderWidthRatio: 3.75 / 170,
    plateRadiusRatio: 7 / 170,
  );
}
