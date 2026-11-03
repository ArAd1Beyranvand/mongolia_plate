FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the free-spirited people of Mongolia to view examples:

https://platexample.ir/#/discover/mongolia:kotlin

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

### Install (Kotlin)

Copy `kotlin/src/commonMain/kotlin/plates/countries/mongolia/` into `plate_core/kotlin/src/commonMain/kotlin/plates/countries/`.

Then run the tests from `plate_core/kotlin/`: `./gradlew jvmTest`.

### Use

```kotlin
import plates.countries.mongolia.country

val spec = country.specs["mn.private"]
println(country.pkg)
```

## Specs

The specs are the same in every language (they come from shared data).

- `mn.private`
- `mn.two_row`

## Themes

- `MongoliaThemes.private`
- `MongoliaThemes.twoRow`

## Change it

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (`MongoliaValidator`).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/mongolia_plate/blob/main/LICENSE).
