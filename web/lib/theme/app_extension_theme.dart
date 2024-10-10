import 'package:flutter/material.dart';
import 'package:gin_vue_admin_web/exports.dart';

class AppExtensionTheme extends ThemeExtension<AppExtensionTheme> {
  final ButtonStyle textButtonStyle;

  const AppExtensionTheme({
    required this.textButtonStyle,
  });

  factory AppExtensionTheme.of(BuildContext context) {
    return Theme.of(context).extension<AppExtensionTheme>() ??
        AppExtensionTheme.fromAppColorScheme(context);
  }

  factory AppExtensionTheme.fromAppColorScheme(BuildContext context) {
    final appColorScheme = Theme.of(context).colorScheme;
    return AppExtensionTheme(
      textButtonStyle: TextButton.styleFrom(
          textStyle: context.textTheme.bodyMedium
      ).withCommonButtonStyle(
        appColorScheme: appColorScheme,
      ),
    );
  }

  @override
  ThemeExtension<AppExtensionTheme> copyWith({
    ButtonStyle? primaryElevated
  }) {
    return AppExtensionTheme(
      textButtonStyle: primaryElevated ?? this.textButtonStyle,
      
    );
  }

  @override
  ThemeExtension<AppExtensionTheme> lerp(
      ThemeExtension<AppExtensionTheme>? other, double t) {
    if (other is! AppExtensionTheme) {
      return this;
    }

    return AppExtensionTheme(
      textButtonStyle: other.textButtonStyle,
      
    );
  }
}

extension ButtonStyleExtension on ButtonStyle {
  ButtonStyle withCommonButtonStyle({
    required ColorScheme appColorScheme,
    Color? normalButtonTextColor,
  }) {
    return copyWith(
      minimumSize: const WidgetStatePropertyAll(Size(60.0, 35.0)),
      mouseCursor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.disabled)) {
          return SystemMouseCursors.forbidden;
        }

        return null;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return appColorScheme.onPrimary.withOpacity(0.38);
        }
        return normalButtonTextColor ?? appColorScheme.primary;
      }),
    );
  }

  ButtonStyle withCommonOutlinedButtonStyle({
    required ColorScheme appColorScheme,
    Color? normalButtonTextColor,
  }) {
    return withCommonButtonStyle(
      appColorScheme: appColorScheme,
      normalButtonTextColor: normalButtonTextColor,
    ).copyWith(
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        return foregroundColor?.resolve(states) ??
            appColorScheme.onPrimary.withOpacity(0.38);
      }),
      side: WidgetStateProperty.resolveWith((states) {
        return BorderSide(
          width: 1.0,
          color: foregroundColor?.resolve(states) ??
              appColorScheme.onPrimary.withOpacity(0.38),
        );
      }),
    );
  }

  ButtonStyle withCommonTextButtonStyle({
    required ColorScheme appColorScheme,
    Color? normalButtonTextColor,
  }) {
    return withCommonButtonStyle(
      appColorScheme: appColorScheme,
      normalButtonTextColor: normalButtonTextColor,
    ).copyWith(
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        return foregroundColor?.resolve(states) ??
            appColorScheme.onPrimary.withOpacity(0.38);
      }),
    );
  }
}
