import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';

/// //////////////////////////////////////////////////////////////
/// Styles - Contains the design system for the entire app.
/// Includes paddings, text styles, timings etc. Does not include colors, check [AppTheme] file for that.

/// Used for all animations in the  app
class Times {
  static const Duration fastest = Duration(milliseconds: 150);
  static const fast = Duration(milliseconds: 250);
  static const medium = Duration(milliseconds: 350);
  static const slow = Duration(milliseconds: 700);
  static const slower = Duration(milliseconds: 1000);
}

class Styles {
  static ButtonStyle getRoundOutLineShape() {
    return TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        minimumSize: const Size(40, 40),
        side: const BorderSide(color: Colors.grey, width: .5),
        textStyle: const TextStyle(fontSize: 14),
        shape: const RoundedRectangleBorder(borderRadius: Corners.medBorder),
        foregroundColor: Colors.grey);
  }

  static ButtonStyle getRoundFillShape() {
    return TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        minimumSize: const Size(40, 40),
        textStyle: const TextStyle(fontSize: 14),
        shape: const RoundedRectangleBorder(borderRadius: Corners.medBorder),
        foregroundColor: Colors.white);
  }

  static WidgetStateProperty<Color?>? resolveWithStates(Color? color) {
    if (color == null) return null;
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return color.withOpacity(.4);
      }
      return color;
    });
  }
}

class TextStyles {
  static TextStyle? getTitleBold(BuildContext context) {
    return context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold);
  }

  static TextStyle? getBodyStyle(BuildContext context) {
    return context.textTheme.bodySmall;
  }
}

class Sizes {
  static const double hitScale = 1;
  static const double childWidth = 150;
  static const double titleWidth = 70;
  static const double titleMiddleWidth = 100;
  static const double iconWidth = 20;

  static double get hit => 40 * hitScale;
}

class IconSizes {
  static const double scale = 1;
  static const double med = 24;
}

class Decorations {
  static InputDecoration getFiledDecoration(String hintText,
      {Widget? counter,Widget? suffixIcon}) {
    return InputDecoration(
      isCollapsed: true,
      hintText: hintText,
      contentPadding: const EdgeInsets.all(10),
      border: const OutlineInputBorder(),
      counter: counter,
      suffixIcon: suffixIcon,
    );
  }
  static InputDecoration getNone() {
   return const InputDecoration(border: InputBorder.none);
  }
}

class Corners {
  static const double sm = 3;
  static const BorderRadius smBorder = BorderRadius.all(smRadius);
  static const Radius smRadius = Radius.circular(sm);

  static const double med = 5;
  static const BorderRadius medBorder = BorderRadius.all(medRadius);
  static const Radius medRadius = Radius.circular(med);

  static const double lg = 8;
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
  static const Radius lgRadius = Radius.circular(lg);

  static const double ra20 = 20;

  static getBorderRadius(double number) {
    Radius lgRadius = Radius.circular(number);
    return BorderRadius.all(lgRadius);
  }

  static getRoundedRectangleBorder(double number) {
    Radius radius = Radius.circular(number);
    return RoundedRectangleBorder(borderRadius: BorderRadius.all(radius));
  }
}

class RadiusConstants {
  const RadiusConstants._();

  static const BorderRadius r1 = BorderRadius.all(Radius.circular(1));
  static const BorderRadius r2 = BorderRadius.all(Radius.circular(2));
  static const BorderRadius r3 = BorderRadius.all(Radius.circular(3));
  static const BorderRadius r4 = BorderRadius.all(Radius.circular(4));
  static const BorderRadius r5 = BorderRadius.all(Radius.circular(5));
  static const BorderRadius r6 = BorderRadius.all(Radius.circular(6));
  static const BorderRadius r7 = BorderRadius.all(Radius.circular(7));
  static const BorderRadius r8 = BorderRadius.all(Radius.circular(8));
  static const BorderRadius r9 = BorderRadius.all(Radius.circular(9));
  static const BorderRadius r10 = BorderRadius.all(Radius.circular(10));
  static const BorderRadius r12 = BorderRadius.all(Radius.circular(12));
  static const BorderRadius r15 = BorderRadius.all(Radius.circular(15));
  static const BorderRadius r16 = BorderRadius.all(Radius.circular(16));
  static const BorderRadius r20 = BorderRadius.all(Radius.circular(20));
  static const BorderRadius r25 = BorderRadius.all(Radius.circular(25));
  static const BorderRadius max = BorderRadius.all(Radius.circular(999999));
}

class SpaceNum {
  static const spaceH = 10.0;
  static const spaceV = 10.0;
}

class Strokes {
  static const double thin = 1;
  static const double thick = 4;
}

class Shadows {
  static List<BoxShadow> get universal => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 10),
      ];

  static List<BoxShadow> get small => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.15),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 1)),
      ];
}
