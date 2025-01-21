import 'package:equatable/equatable.dart';



class MenuManagerState extends Equatable {
  final int currentIndex;

  const MenuManagerState({required this.currentIndex});

  factory MenuManagerState.initial() => const MenuManagerState(currentIndex: 0);

  MenuManagerState copyWith({int? currentIndex}) {
    return MenuManagerState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [currentIndex];
}
