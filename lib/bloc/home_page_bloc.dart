import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:home_page_app/api_utils/rest_api.dart';
import 'package:home_page_app/bloc/base_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:home_page_app/api_response/trending_seller_response.dart';
class HomePageBloc implements BaseBloc {
  //controller//
  final _trendingSellerController = BehaviorSubject<List<TrendingSellerResponse>>();

  //set data//
  Function(List<TrendingSellerResponse>) get changedTrendingSeller => _trendingSellerController.sink.add;

  Stream<List<TrendingSellerResponse>> get trendingController => _trendingSellerController.stream;

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



  @override
  void dispose() {
    _trendingSellerController?.close();
  }
}
