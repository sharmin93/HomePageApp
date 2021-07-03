import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:home_page_app/api_utils/constant_url.dart';
import 'package:home_page_app/api_utils/rest_api.dart';
import 'package:home_page_app/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:home_page_app/api_response/trending_seller_response.dart';
import 'package:home_page_app/api_response/trending_product_response.dart';
import 'package:home_page_app/api_response/product_servive_response.dart';

class HomePageBloc implements BaseBloc {
  //controller//
  final _trendingSellerController =
      BehaviorSubject<List<TrendingSellerResponse>>();
  final _trendingProductController = BehaviorSubject<List<ProductResponse>>();
  final _productServiceController =
      BehaviorSubject<List<ProductServiceResponse>>();
  final _newArrivalController = BehaviorSubject<List<ProductResponse>>();

  //set data//
  Function(List<TrendingSellerResponse>) get changedTrendingSeller =>
      _trendingSellerController.sink.add;

  Function(List<ProductResponse>) get changedTrendingProduct =>
      _trendingProductController.sink.add;

  Function(List<ProductServiceResponse>) get changedProductService =>
      _productServiceController.sink.add;

  Function(List<ProductResponse>) get changedNewArrival =>
      _newArrivalController.sink.add;

  Stream<List<TrendingSellerResponse>> get trendingController =>
      _trendingSellerController.stream;

  Stream<List<ProductResponse>> get productController =>
      _trendingProductController.stream;

  Stream<List<ProductServiceResponse>> get productServiceController =>
      _productServiceController.stream;

  Stream<List<ProductResponse>> get newArrival => _newArrivalController.stream;

  fetchTrendingSeller() {
    callAPI(trendingSellerUrl).then((response) {
      if (response.statusCode == 200) {
        var jsonArray = (json.decode(response.body))[0];

        List<TrendingSellerResponse> result = List();
        for (int index = 0; index < jsonArray.length; index++) {
          result.add(TrendingSellerResponse.fromJson(jsonArray[index]));
        }

        _trendingSellerController.sink.add(result);
      }
    });
  }

  fetchTrendingProduct() {
    callAPI(trendingProductUrl).then((response) {
      if (response.statusCode == 200) {
        var jsonArray = (json.decode(response.body))[0];

        List<ProductResponse> result = List();
        for (int index = 0; index < jsonArray.length; index++) {
          result.add(ProductResponse.fromJson(jsonArray[index]));
        }

        _trendingProductController.sink.add(result);
      }
    });
  }

  fetchNewArrival() {
    callAPI(newArrivalUrl).then((response) {
      if (response.statusCode == 200) {
        var jsonArray = (json.decode(response.body))[0];

        List<ProductResponse> result = List();
        for (int index = 0; index < jsonArray.length; index++) {
          result.add(ProductResponse.fromJson(jsonArray[index]));
        }

        _newArrivalController.sink.add(result);
      }
    });
  }

  fetchProduct() {
    callAPI(productUrl).then((response) {
      if (response.statusCode == 200) {
        var jsonArray = (json.decode(response.body))[0];
        List<ProductServiceResponse> result = List();
        for (int index = 0; index < jsonArray.length; index++) {
          result.add(ProductServiceResponse.fromJson(jsonArray[index]));
        }
        _productServiceController.sink.add(result);
      }
    });
  }

  @override
  void dispose() {
    _trendingSellerController?.close();
    _trendingProductController?.close();
    _productServiceController?.close();
    _newArrivalController?.close();
  }
}
