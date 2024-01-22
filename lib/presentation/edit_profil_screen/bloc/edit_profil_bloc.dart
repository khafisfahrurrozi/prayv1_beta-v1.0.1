import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:prayv1_beta/presentation/edit_profil_screen/models/edit_profil_model.dart';
part 'edit_profil_event.dart';
part 'edit_profil_state.dart';

/// A bloc that manages the state of a EditProfil according to the event that is dispatched to it.
class EditProfilBloc extends Bloc<EditProfilEvent, EditProfilState> {
  EditProfilBloc(EditProfilState initialState) : super(initialState) {
    on<EditProfilInitialEvent>(_onInitialize);
  }

  _onInitialize(
    EditProfilInitialEvent event,
    Emitter<EditProfilState> emit,
  ) async {
    emit(state.copyWith(
      editProfileController: TextEditingController(),
      emailController: TextEditingController(),
      phoneNumberController: TextEditingController(),
      twentyEightController: TextEditingController(),
      zipcodeController: TextEditingController(),
    ));
  }
}
