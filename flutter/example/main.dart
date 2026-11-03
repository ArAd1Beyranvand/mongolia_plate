import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:mongolia_plate/mongolia_plate.dart';

void main() => runApp(
  PlateExampleApp(spec: MongoliaPlates.private, theme: MongoliaThemes.private),
);
