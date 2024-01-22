import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/isidata_item_model.dart';
import 'package:prayv1_beta/presentation/isidata_screen/models/isidata_model.dart';
part 'isidata_event.dart';
part 'isidata_state.dart';

/// A bloc that manages the state of a Isidata according to the event that is dispatched to it.
class IsidataBloc extends Bloc<IsidataEvent, IsidataState> {
  IsidataBloc(IsidataState initialState) : super(initialState) {
    on<IsidataInitialEvent>(_onInitialize);
  }

  List<IsidataItemModel> fillIsidataItemList() {
    return List.generate(3, (index) => IsidataItemModel());
  }

  _onInitialize(
    IsidataInitialEvent event,
    Emitter<IsidataState> emit,
  ) async {
    emit(state.copyWith(
      enterYourUsernameController: TextEditingController(),
      monthController: TextEditingController(),
      phoneNumberFieldController: TextEditingController(),
      passwordFieldController: TextEditingController(),
    ));
    emit(state.copyWith(
        isidataModelObj: state.isidataModelObj?.copyWith(
      isidataItemList: fillIsidataItemList(),
    )));
  }
}
