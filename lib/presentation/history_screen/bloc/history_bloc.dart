import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/transactionlist_item_model.dart';
import 'package:prayv1_beta/presentation/history_screen/models/history_model.dart';
part 'history_event.dart';
part 'history_state.dart';

/// A bloc that manages the state of a History according to the event that is dispatched to it.
class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc(HistoryState initialState) : super(initialState) {
    on<HistoryInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HistoryInitialEvent event,
    Emitter<HistoryState> emit,
  ) async {
    emit(state.copyWith(
        historyModelObj: state.historyModelObj?.copyWith(
      transactionlistItemList: fillTransactionlistItemList(),
    )));
  }

  List<TransactionlistItemModel> fillTransactionlistItemList() {
    return [
      TransactionlistItemModel(
          userImage: ImageConstant.imgEllipse16,
          alexandria: "Alexandria",
          duration: "Yesterday · 19:12",
          rpCounter: "Rp 600.000"),
      TransactionlistItemModel(
          userImage: ImageConstant.imgEllipse17,
          alexandria: "Immanuel",
          duration: "May 31, 2023 · 09:13",
          rpCounter: "Rp 200.000"),
      TransactionlistItemModel(
          userImage: ImageConstant.imgEllipse1760x60,
          alexandria: "Kayshania",
          duration: "April 27, 2023 · 20:29",
          rpCounter: "Rp 57.000"),
      TransactionlistItemModel(
          alexandria: "Maybank - Alexia Putri Raharjo",
          duration: " May 13, 2023 · 21:54",
          rpCounter: "Rp 745.000"),
      TransactionlistItemModel(
          alexandria: "BRI - Akhmad Maariz",
          duration: "April 12, 2023 · 04:18",
          rpCounter: "Rp 450.000")
    ];
  }
}
