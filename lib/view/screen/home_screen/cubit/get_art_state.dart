part of 'get_art_cubit.dart';

@freezed
class GetArtState with _$GetArtState {
  const factory GetArtState({
    @Default([]) List<Art> arts,
    DioError? error,
    @Default(1) int page,
    @Default(10) int limit,
  }) = _GetArtState;
}
