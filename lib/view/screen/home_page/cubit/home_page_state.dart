import 'package:equatable/equatable.dart';

class HomePageState extends Equatable {
  const HomePageState(this.urlArt);
  final String urlArt;

  @override
  List<Object> get props => [urlArt];
}
