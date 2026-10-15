import 'dart:math';

import 'package:flutter/widgets.dart' show AssetImage, EdgeInsets;
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'mongolia_colors.dart';
import 'mongolia_country.dart';
import 'mongolia_regions.dart';

/// Where the ink sits, in plate units.
///
/// The one-row plate is 520 × 110 mm (the article's size), measured off
/// `.plateref/mn/flat_Plak_Mo_olistan_2001.png` by connected components of the
/// ink: digits `1 2 3 4` ink y 16.8–86.5, centres 88, 141.4, 189.5, 240.5;
/// letters ink y 23–84, centres 356, 413, 467.5; Soyombo x 20.5–58.75
/// y 13.75–84.75; oval x 271.8–321.8 y 42.2–73 with a stroke about 1.7 thick;
/// `MNG` ink x 278–316.75 y 50.75–64.25.
///
/// The two-row plate is the reference `Plak-15x30_Mo_olistan_2001`, whose
/// aspect is 1.77. The article gives no size for it, so the canvas is 300 × 170
/// (the oval comes out the same 50 wide as on the one-row plate at that
/// scale). Its flattened measurements (x ÷ 520 × 300, y ÷ 110 × 170): digits
/// ink y 12.7–83.5, centres 64, 115.1, 161, 210; letters ink y 97.1–158.9,
/// centres 89.1, 143.5, 195.9; Soyombo x 15.9–51.8 y 81.1–153; oval x 232–280
/// y 113.6–145.
///
/// A slot's ink is about 55% of its box height (`glyphStyle` is 0.72 of the
/// box, a bold cap 0.75 of that), so each register's box is ink / 0.55 centred
/// on the measured ink, shrunk where it would leave the canvas. That limits the
/// one-row digits to about 83% of the reference ink, and both two-row rows to
/// about 75%.
abstract final class _Layout {
  static const _Design oneRow = _Design(
    width: 520,
    height: 110,
    digits: _Run(88.5, 50.8, 16.8, 86.3),
    suffix: _Run(356, 55.75, 23, 84),
    serial: _Run(467.5, 55.75, 23, 84),
    soyombo: PlateBox(20.5, 13.75, 38.25, 71),
    oval: PlateBox(271.8, 42.2, 50, 30.8),
  );

  static const _Design twoRow = _Design(
    width: 300,
    height: 170,
    digits: _Run(64, 48.67, 12.7, 83.5),
    suffix: _Run(89.1, 54.4, 97.1, 158.9),
    serial: _Run(195.9, 54.4, 97.1, 158.9),
    soyombo: PlateBox(15.9, 81.1, 35.9, 71.9),
    oval: PlateBox(231, 113.9, 50, 30.8),
  );

  /// The oval's stroke, measured at its left end and top.
  static const double ovalStroke = 1.7;

  /// `MNG` ink 38.75 × 13.5 inside the oval; the label is centred on it. The
  /// glyph is 20 rather than the 24.5 the height alone asks for: the bold face
  /// is wider than the reference's, and 24.5 spills out of the oval.
  static const double mngGlyph = 20;
  static const double mngWidth = 40;
  static const double mngCentreDx = 0.6;
}

final class _Run {
  const _Run(this.firstCx, this.pitch, this.inkTop, this.inkBottom);
  final double firstCx, pitch, inkTop, inkBottom;
}

final class _Design {
  const _Design({
    required this.width,
    required this.height,
    required this.digits,
    required this.suffix,
    required this.serial,
    required this.soyombo,
    required this.oval,
  });
  final double width, height;
  final _Run digits, suffix, serial;
  final PlateBox soyombo, oval;
}

PlateSlot _field(_Design design, PlateAlphabet alphabet, _Run run, int count) {
  final double centre = (run.inkTop + run.inkBottom) / 2;
  final double fit =
      2 * (centre < design.height - centre ? centre : design.height - centre);
  final double wanted = (run.inkBottom - run.inkTop) / 0.55;
  final double height = wanted < fit ? wanted : fit;
  return PlateSlot(
    alphabet: alphabet,
    box: PlateBox(
      run.firstCx - run.pitch / 2,
      centre - height / 2,
      count * run.pitch,
      height,
    ),
    length: count,
    spacing: max(0, run.pitch - 0.6 * 0.72 * height),
  );
}

const AssetImage _soyombo = AssetImage(
  // Commons: File:Soyombo_red.svg; assets/icons/soyombo.svg is the vector. The
  // PNG is it rasterised with its masks applied (the crescent and the
  // yin-yang disc).
  'assets/icons/soyombo.png',
  package: 'mongolia_plate',
);

/// `1234 УБ А`: the Soyombo, four digits, the `MNG` oval, then the aimag
/// suffix and a serial letter. The oval is a black capsule with a white one
/// inside it, since a band has no outline.
PlateSpec _registration(String id, _Design d) {
  final PlateSlot digits = _field(d, MongoliaAlphabets.digits, d.digits, 4);
  final PlateSlot suffix = _field(d, MongoliaAlphabets.letters, d.suffix, 2);
  final PlateSlot serial = _field(d, MongoliaAlphabets.letters, d.serial, 1);
  final PlateBox o = d.oval;
  const double s = _Layout.ovalStroke;
  return PlateSpec(
    id: id,
    country: MongoliaCountry.mongolia,
    canvasWidth: d.width,
    canvasHeight: d.height,
    panel: const PlatePanel(
      box: PlateBox(0, 0, 0, 0),
      padding: EdgeInsets.zero,
    ),
    noPanel: true,
    slots: <PlateSlot>[digits, suffix, serial],
    bands: <PlateBand>[
      PlateBand(
        box: o,
        color: MongoliaColors.black,
        topCornerRadius: o.height / 2,
        bottomCornerRadius: o.height / 2,
      ),
      PlateBand(
        box: PlateBox(o.left + s, o.top + s, o.width - 2 * s, o.height - 2 * s),
        color: MongoliaColors.white,
        topCornerRadius: o.height / 2 - s,
        bottomCornerRadius: o.height / 2 - s,
      ),
    ],
    labels: <PlateLabel>[
      PlateLabel(
        text: 'MNG',
        box: PlateBox(
          o.left + (o.width - _Layout.mngWidth) / 2 + _Layout.mngCentreDx,
          o.top + (o.height - 15) / 2,
          _Layout.mngWidth,
          15,
        ),
        glyphHeight: _Layout.mngGlyph,
      ),
    ],
    decals: <PlateDecal>[PlateDecal(image: _soyombo, box: d.soyombo)],
    textGroups: <PlateTextGroup>[
      PlateTextGroup(<int>[0], key: 'number'),
      PlateTextGroup(<int>[1], key: 'suffix'),
      PlateTextGroup(<int>[2], key: 'serial'),
    ],
    resolveRegion: MongoliaRegions.captionOf,
  );
}

/// The Mongolian plates since 2001 (`1234 УБА`).
///
/// - [private]: the one-row 520 × 110 plate.
/// - [twoRow]: the short two-row plate, digits above the letters, from the
///   unlabelled `Plak-15x30` picture; the article names no category for it.
///
/// Not implemented: the pre-2001 plates (superseded); the article shows no
/// other category. Since about 2018 new plates use a Roboto-style typeface;
/// the reference is the earlier one and Roboto is what the engine draws.
abstract final class MongoliaPlates {
  static final PlateSpec private = _registration('mn.private', _Layout.oneRow);

  static final PlateSpec twoRow = _registration('mn.two_row', _Layout.twoRow);

  static List<PlateSpec> get all => <PlateSpec>[private, twoRow];
}
