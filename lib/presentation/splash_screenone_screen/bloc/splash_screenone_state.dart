// ignore_for_file: must_be_immutable

part of 'splash_screenone_bloc.dart';

/// Represents the state of SplashScreenone in the application.
class SplashScreenoneState extends Equatable {
  SplashScreenoneState({this.splashScreenoneModelObj});

  SplashScreenoneModel? splashScreenoneModelObj;

  @override
  List<Object?> get props => [
        splashScreenoneModelObj,
      ];
  SplashScreenoneState copyWith(
      {SplashScreenoneModel? splashScreenoneModelObj}) {
    return SplashScreenoneState(
      splashScreenoneModelObj:
          splashScreenoneModelObj ?? this.splashScreenoneModelObj,
    );
  }
}
