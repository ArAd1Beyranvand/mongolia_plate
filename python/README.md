FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the free-spirited people of Mongolia to view examples:

https://platexample.ir/#/discover/mongolia:python

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

### Install (Python)

Copy `python/plates/countries/mongolia/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.mongolia.data import SPECS, THEMES

spec = SPECS["mn.private"]
theme = THEMES["MongoliaThemes.private"]
print(spec.id)
```

## Specs

The specs are the same in every language (they come from shared data).

- `mn.private`
- `mn.two_row`

## Themes

- `MongoliaThemes.private`
- `MongoliaThemes.twoRow`

## Change it

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names `MongoliaValidator` to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/mongolia_plate/blob/main/LICENSE).
