import 'package:flutter_base/data/model/base_model/pagination.model.dart';

abstract class ApiResponse<T> {
  ApiResponse({this.pagination, this.data});
  final Pagination? pagination;
  final T? data;
}
