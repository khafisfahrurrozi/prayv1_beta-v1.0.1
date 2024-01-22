// ignore_for_file: must_be_immutable

part of 'splash_screentwo_bloc.dart';

/// Represents the state of SplashScreentwo in the application.
class SplashScreentwoState extends Equatable {
  SplashScreentwoState({this.splashScreentwoModelObj});

  SplashScreentwoModel? splashScreentwoModelObj;

  @override
  List<Object?> get props => [
        splashScreentwoModelObj,
      ];
  SplashScreentwoState copyWith(
      {SplashScreentwoModel? splashScreentwoModelObj}) {
    return SplashScreentwoState(
      splashScreentwoModelObj:
          splashScreentwoModelObj ?? this.splashScreentwoModelObj,
    );
  }
}
