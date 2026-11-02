"""Port of mongolia_plate/lib/src/mongolia_validators.dart. Hand-ported; codegen never overwrites this file."""
from __future__ import annotations

from plates.core.validators.plate_validator import (
    GatedPlateValidator, PlateEntry, PlateValidation, is_digits_of_length)

_SUFFIXES = (
    "АР", "БН", "БР", "БӨ", "БУ", "ГА", "ГС", "ДА", "ДГ", "ДО", "ДУ", "ОР",
    "ХЭ", "ХО", "ХӨ", "НА", "ӨМ", "ӨВ", "СЭ", "СҮ", "СБ", "ТӨ", "УБ", "УН",
    "УА", "УЕ", "УК", "УВ", "ЗА",
)
_LETTERS = tuple("АБВГДЕЁЖЗИЙКЛМНОӨПРСТУҮФХЦЧШЩЪЫЬЭЮЯ")


class MongoliaValidator(GatedPlateValidator):
    gate_group = 'serial'

    REASON_NUMBER = "The number is four digits."
    REASON_SUFFIX = "The aimag suffix is not a known one."
    REASON_SERIAL = "The serial is one Cyrillic letter."

    def judge(self, entry: PlateEntry) -> PlateValidation:
        if not is_digits_of_length(entry.group("number"), 4):
            return PlateValidation.invalid(self.REASON_NUMBER)
        if entry.group("suffix") not in _SUFFIXES:
            return PlateValidation.invalid(self.REASON_SUFFIX)
        if entry.group("serial") not in _LETTERS:
            return PlateValidation.invalid(self.REASON_SERIAL)
        return PlateValidation.valid()
