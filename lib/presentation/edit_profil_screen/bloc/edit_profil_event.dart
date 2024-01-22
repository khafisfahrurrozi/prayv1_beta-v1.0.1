// ignore_for_file: must_be_immutable

part of 'edit_profil_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///EditProfil widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class EditProfilEvent extends Equatable {}

/// Event that is dispatched when the EditProfil widget is first created.
class EditProfilInitialEvent extends EditProfilEvent {
  @override
  List<Object?> get props => [];
}
