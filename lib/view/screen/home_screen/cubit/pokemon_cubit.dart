import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_state.dart';
part 'pokemon_cubit.freezed.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonState.initial());
}
