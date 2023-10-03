import 'package:flutter_base/data/model/base_model/pagination.model.dart';

abstract class ApiResponse<T> {
  final Pagination? pagination;
  final T? data;
  ApiResponse({this.pagination, this.data});
}
