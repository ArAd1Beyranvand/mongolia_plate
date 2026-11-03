FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the free-spirited people of Mongolia to view examples:

https://platexample.ir/#/discover/mongolia:flutter

# mongolia_plate

Mongolia's licence plates for the plate_core library — the black-on-white one-row and two-row plates with the red Soyombo, a Cyrillic alphabet and an advisory validator.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/mongolia_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/mongolia:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/mongolia_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/mongolia:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/mongolia_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/mongolia:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/mongolia_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/mongolia:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  mongolia_plate: ^0.1.0
```

### Use

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

## Specs

Each spec is one plate layout.

- `MongoliaPlates.private`
- `MongoliaPlates.twoRow`

## Themes

- `MongoliaThemes.private`
- `MongoliaThemes.twoRow`

## Change it

`PlateCanvas` takes `spec:` (an entry of `MongoliaPlates`) and `theme:` (an entry of `MongoliaThemes`). Set `validator:` to `MongoliaValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `MongoliaCountry` — the country panel.
- `MongoliaValidator` — the plate validator.
- `MongoliaRegions` — code table.

## Plates

The Mongolian plates since 2001 (`1234 УБА`). `twoRow` is the short
two-row plate from the unlabelled `Plak-15x30` picture; the article names no
category for it.

Not implemented: the pre-2001 plates (superseded); the article shows no
other category. Since about 2018 new plates use a Roboto-style typeface;
the reference is the earlier one and Roboto is what the engine draws.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/mongolia_plate/blob/main/LICENSE).
