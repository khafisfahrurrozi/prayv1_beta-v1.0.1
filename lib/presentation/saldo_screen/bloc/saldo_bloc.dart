import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/menu_item_model.dart';
import '../models/menu1_item_model.dart';
import 'package:prayv1_beta/presentation/saldo_screen/models/saldo_model.dart';
part 'saldo_event.dart';
part 'saldo_state.dart';

/// A bloc that manages the state of a Saldo according to the event that is dispatched to it.
class SaldoBloc extends Bloc<SaldoEvent, SaldoState> {
  SaldoBloc(SaldoState initialState) : super(initialState) {
    on<SaldoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SaldoInitialEvent event,
    Emitter<SaldoState> emit,
  ) async {
    emit(state.copyWith(
        saldoModelObj: state.saldoModelObj?.copyWith(
      menuItemList: fillMenuItemList(),
      menu1ItemList: fillMenu1ItemList(),
    )));
  }

  List<MenuItemModel> fillMenuItemList() {
    return [
      MenuItemModel(
          transferOne: ImageConstant.imgTransfer1, transfer: "Transfer"),
      MenuItemModel(
          transferOne: ImageConstant.imgIconWallet, transfer: "Top Up"),
      MenuItemModel(
          transferOne: ImageConstant.imgIconWtihdraw, transfer: "Withdraw")
    ];
  }

  List<Menu1ItemModel> fillMenu1ItemList() {
    return [
      Menu1ItemModel(
          iconPhone: ImageConstant.imgIconPhone, pulsaData: "Pulsa & Data"),
      Menu1ItemModel(
          iconPhone: ImageConstant.imgIconEducation, pulsaData: "Pendidikan"),
      Menu1ItemModel(
          iconPhone: ImageConstant.imgIconElectirc, pulsaData: "Listrik"),
      Menu1ItemModel(
          iconPhone: ImageConstant.imgHealthcare1, pulsaData: "Asuransi"),
      Menu1ItemModel(iconPhone: ImageConstant.imgIconWater, pulsaData: "PDAM"),
      Menu1ItemModel(
          iconPhone: ImageConstant.imgCreditCard1, pulsaData: "E-Money")
    ];
  }
}
