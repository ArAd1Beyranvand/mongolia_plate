FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the free-spirited people of Mongolia to view examples:

https://platexample.ir/#/discover/mongolia

# mongolia_plate

Mongolia's licence plates for the `plate_core` library. The black-on-white one-row and two-row plates with the red Soyombo, a Cyrillic alphabet and an advisory validator.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  mongolia_plate: ^0.1.0
```

## Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:mongolia_plate/mongolia_plate.dart';

PlateCanvas(
  spec: MongoliaPlates.private,
  theme: MongoliaThemes.private,
  validator: const MongoliaValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Contains

- `MongoliaCountry` — country panel: `mongolia`.
- `MongoliaPlates` — 2 plate specs: `private`, `twoRow`.
- `MongoliaThemes` — 2 themes: `private`, `twoRow`.
- `MongoliaValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `MongoliaRegions` — code table.
- 3 bundled assets (`mongolia_flag.svg`, `soyombo.svg`, `soyombo.png`).

## Plates

The Mongolian plates since 2001 (`1234 УБА`). `twoRow` is the short
two-row plate from the unlabelled `Plak-15x30` picture; the article names no
category for it.

Not implemented: the pre-2001 plates (superseded); the article shows no
other category. Since about 2018 new plates use a Roboto-style typeface;
the reference is the earlier one and Roboto is what the engine draws.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

