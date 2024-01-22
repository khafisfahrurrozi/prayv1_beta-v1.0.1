// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'menu_item_model.dart';
import 'menu1_item_model.dart';

/// This class defines the variables used in the [saldo_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SaldoModel extends Equatable {
  SaldoModel({
    this.menuItemList = const [],
    this.menu1ItemList = const [],
  }) {}

  List<MenuItemModel> menuItemList;

  List<Menu1ItemModel> menu1ItemList;

  SaldoModel copyWith({
    List<MenuItemModel>? menuItemList,
    List<Menu1ItemModel>? menu1ItemList,
  }) {
    return SaldoModel(
      menuItemList: menuItemList ?? this.menuItemList,
      menu1ItemList: menu1ItemList ?? this.menu1ItemList,
    );
  }

  @override
  List<Object?> get props => [menuItemList, menu1ItemList];
}
