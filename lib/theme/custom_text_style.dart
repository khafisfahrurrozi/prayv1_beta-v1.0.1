import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack90002 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90002,
        fontSize: 16.fSize,
      );
  static get bodyLargeLilitaOneOnErrorContainer =>
      theme.textTheme.bodyLarge!.lilitaOne.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get bodyMediumBlack90002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90002,
      );
  static get bodyMediumBlack9000213 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90002.withOpacity(0.44),
        fontSize: 13.fSize,
      );
  static get bodyMediumBlack9000213_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90002.withOpacity(0.51),
        fontSize: 13.fSize,
      );
  static get bodyMediumBlack9000213_2 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90002.withOpacity(0.7),
        fontSize: 13.fSize,
      );
  static get bodyMediumBlack9000213_3 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90002.withOpacity(0.39),
        fontSize: 13.fSize,
      );
  static get bodyMediumBluegray400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray400,
      );
  static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyMediumGray50002 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray50002,
      );
  static get bodyMediumGray600b2 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray600B2,
        fontSize: 13.fSize,
      );
  static get bodyMediumGray700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray700,
      );
  static get bodyMediumLilitaOneOnErrorContainer =>
      theme.textTheme.bodyMedium!.lilitaOne.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get bodyMediumOnErrorContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get bodySmallBlack90002 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black90002.withOpacity(0.8),
        fontSize: 10.fSize,
      );
  static get bodySmallLilitaOneOnErrorContainer =>
      theme.textTheme.bodySmall!.lilitaOne.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontSize: 8.fSize,
      );
  static get bodySmallOnErrorContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );
  static get bodySmallRobotoGray800bf =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.gray800Bf,
        fontSize: 8.fSize,
      );
  // Label text style
  static get labelLargeBlack90002 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black90002.withOpacity(0.6),
      );
  static get labelLargeManropeOnPrimary =>
      theme.textTheme.labelLarge!.manrope.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 12.fSize,
      );
  static get labelLargeOnPrimaryContainer =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w500,
      );
  static get labelLargeRobotoGray800 =>
      theme.textTheme.labelLarge!.roboto.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w500,
      );
  // Title text style
  static get titleLargeGray90002 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.gray90002,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumGray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumManropeBlack900 =>
      theme.textTheme.titleMedium!.manrope.copyWith(
        color: appTheme.black900,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumManropeBlue800 =>
      theme.textTheme.titleMedium!.manrope.copyWith(
        color: appTheme.blue800,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallManropeBlue800 =>
      theme.textTheme.titleSmall!.manrope.copyWith(
        color: appTheme.blue800,
        fontSize: 14.fSize,
      );
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get manrope {
    return copyWith(
      fontFamily: 'Manrope',
    );
  }

  TextStyle get lilitaOne {
    return copyWith(
      fontFamily: 'Lilita One',
    );
  }
}
