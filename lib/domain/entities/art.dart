import 'package:equatable/equatable.dart';

class Art with EquatableMixin {
  Art({this.url});
  String? url;

  @override
  List<Object?> get props => [url];
}
