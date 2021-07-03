import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:home_page_app/api_utils/rest_api.dart';
import 'package:home_page_app/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:home_page_app/api_response/trending_seller_response.dart';
import 'package:home_page_app/api_response/trending_product_response.dart';
import 'package:home_page_app/api_response/product_servive_response.dart';
class HomePageBloc implements BaseBloc {
  //controller//
  final _trendingSellerController = BehaviorSubject<List<TrendingSellerResponse>>();
  final _trendingProductController = BehaviorSubject<List<TrendingProductResponse>>();
  final _productServiceController = BehaviorSubject<List<ProductServiceResponse>>();

  //set data//
  Function(List<TrendingSellerResponse>) get changedTrendingSeller => _trendingSellerController.sink.add;
  Function(List<TrendingProductResponse>) get changedTrendingProduct => _trendingProductController.sink.add;
  Function(List<ProductServiceResponse>) get changedProductService => _productServiceController.sink.add;

  Stream<List<TrendingSellerResponse>> get trendingController => _trendingSellerController.stream;
  Stream<List<TrendingProductResponse>> get productController => _trendingProductController.stream;
  Stream<List<ProductServiceResponse>> get productServiceController => _productServiceController.stream;

  fetchTrendingSeller()
  {
    callAPI('https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=trending_seller').then((response) {
      if(response.statusCode==200){
        var  jsonArray = (json.decode(response.body))[0];

        List<TrendingSellerResponse> result = List();
        for(int index=0; index<jsonArray.length; index++){

          result.add(TrendingSellerResponse.fromJson(jsonArray[index]));
        }

        _trendingSellerController.sink.add(result);
      }
    });

  }
fetchTrendingProduct()
  {
    callAPI('https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=trendingProducts').then((response) {
      if(response.statusCode==200){
        var  jsonArray = (json.decode(response.body))[0];

        List<TrendingProductResponse> result = List();
        for(int index=0; index<jsonArray.length; index++){

          result.add(TrendingProductResponse.fromJson(jsonArray[index]));
        }

        _trendingProductController.sink.add(result);
      }
    });

  }
fetchProduct()
  {
    callAPI('https://bd.ezassist.me/ws/mpFeed?instanceName=bd.ezassist.me&opt=stories').then((response) {
      if(response.statusCode==200){
        var  jsonArray = (json.decode(response.body))[0];
        List<ProductServiceResponse> result = List();
        for(int index=0; index<jsonArray.length; index++){

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
  }
}
