import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:restaurant_app/app/data/models/restaurant_detail_model.dart';
import 'package:restaurant_app/app/data/models/restaurant_list_model.dart';
import 'package:restaurant_app/app/constant/config.dart';

import '../models/restaurant_searched_model.dart';

class RestaurantService {
  Dio dio = Dio(BaseOptions(
    responseType: ResponseType.json,
    receiveTimeout: const Duration(seconds: 20),
    connectTimeout: const Duration(seconds: 20),
    validateStatus: (int? status) {
      return status != null;
      // return status != null && status >= 200 && status < 300;
    },
  ));

  Future<DataRestaurant?> getListOfRestaurant() async {
    try {
      Response response = await dio.get(
        "${CONFIG.server}list",
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        DataRestaurant? model = DataRestaurant.fromJson(response.data);
        return model;
      }
      if (response.statusCode! >= 400 && response.statusCode! <= 500) {
        return null;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }

  Future<DetailDataRestaurant?> getDetailOfRestaurant(id) async {
    try {
      Response response = await dio.get(
        "${CONFIG.server}detail/$id",
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        DetailDataRestaurant? model =
            DetailDataRestaurant.fromJson(response.data);
        return model;
      }
      if (response.statusCode! >= 400 && response.statusCode! <= 500) {
        return null;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }

  Future<RestaurantSearchModel?> searchRestaurant(query) async {
    try {
      Response response = await dio.get(
        "${CONFIG.server}search?q=$query",
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        RestaurantSearchModel model =
            RestaurantSearchModel.fromJson(response.data);
        return model;
      }
      if (response.statusCode! >= 400 && response.statusCode! <= 500) {
        return null;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}
