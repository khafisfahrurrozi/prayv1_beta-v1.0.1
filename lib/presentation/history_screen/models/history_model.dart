// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'transactionlist_item_model.dart';

/// This class defines the variables used in the [history_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HistoryModel extends Equatable {
  HistoryModel({this.transactionlistItemList = const []}) {}

  List<TransactionlistItemModel> transactionlistItemList;

  HistoryModel copyWith(
      {List<TransactionlistItemModel>? transactionlistItemList}) {
    return HistoryModel(
      transactionlistItemList:
          transactionlistItemList ?? this.transactionlistItemList,
    );
  }

  @override
  List<Object?> get props => [transactionlistItemList];
}
