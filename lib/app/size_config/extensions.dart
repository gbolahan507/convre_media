import 'package:flutter/material.dart';
import 'package:convre/export.dart';

import 'config.dart';

// Extensions to easily reach the size configuration class

extension SizeExtension on num {
  num get h => SizeConfig.height(this.toDouble());

  num get w => SizeConfig.width(this.toDouble());

  num get sp => SizeConfig.textSize(this.toDouble());
}



 Widget horizontalSpaceTiny = SizedBox(width: 5.0.w);
 Widget horizontalSpaceTiny7 = SizedBox(width: 7.0.w);
 Widget horizontalSpaceSmall = SizedBox(width: 10.0.w);
 Widget horizontalSpaceMedium = SizedBox(width: 25.0.w);

 Widget verticalSpaceTiny = SizedBox(height: 5.0.h);
 Widget verticalSpaceTiny7 = SizedBox(height: 7.0.h);

 Widget verticalSpaceSmall = SizedBox(height: 10.0.h);
 Widget verticalSpaceMedium = SizedBox(height: 20.0.h);
 Widget verticalSpaceMedium30 = SizedBox(height: 25.0.h);
 Widget verticalSpaceLarge = SizedBox(height: 50.0.h);
 Widget verticalSpaceMassive = SizedBox(height: 120.0.h);