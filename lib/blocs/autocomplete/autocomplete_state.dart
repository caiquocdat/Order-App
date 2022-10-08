part of 'autocomplete_bloc.dart';

abstract class AutocompleteState extends Equatable {
  const AutocompleteState();

  @override
  List<Object> get props => [];
}

class AutocompleteLoading extends AutocompleteState {}

class AutocompleteLoaded extends AutocompleteState {
  final List<Location> autocomplete;
  final String address;

  const AutocompleteLoaded({required this.autocomplete,required this.address});

  @override
  List<Object> get props => [address,autocomplete];
}

class AutocompleteError extends AutocompleteState {}