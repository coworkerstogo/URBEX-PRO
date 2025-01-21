import 'package:equatable/equatable.dart';

abstract class MenuManagerEvent extends Equatable {
  const MenuManagerEvent();

  @override
  List<Object?> get props => [];
}

class MenuItemSelected extends MenuManagerEvent {
  final int index;

  const MenuItemSelected(this.index);

  @override
  List<Object?> get props => [index];
}
