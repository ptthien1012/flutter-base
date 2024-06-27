import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_base/data/model/models.dart';
import 'package:flutter_base/domain/usecase/art_usecase.dart';
import 'package:flutter_base/view/screen/home_page/cubit/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageState(''));
  final artUseCase = getIt<ArtUseCase>();

  Future<void> getUrlArt() async {
    final data = await artUseCase.call(page: 1, limit: 1);
    print(data);
  }
}
