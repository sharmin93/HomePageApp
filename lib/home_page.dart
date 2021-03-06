import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_page_app/bloc/home_page_bloc.dart';
import 'package:home_page_app/widgets/new_shops_widgets.dart';
import 'package:home_page_app/widgets/trending_seller_widgets.dart';
import 'package:home_page_app/api_response/trending_seller_response.dart';
import 'package:home_page_app/api_response/trending_product_response.dart';
import 'package:home_page_app/widgets/trending_product_widget.dart';
import 'package:home_page_app/api_response/product_servive_response.dart';
import 'package:home_page_app/widgets/product_services_widgets.dart';
import 'package:home_page_app/widgets/new_arrival_widgets.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var homePageBloc=HomePageBloc();
@override
  void initState() {
    super.initState();
    homePageBloc.fetchTrendingSeller();
    homePageBloc.fetchTrendingProduct();
    homePageBloc.fetchProduct();
    homePageBloc.fetchNewArrival();
    homePageBloc.fetchNewShops();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),centerTitle: true,),
      body: SingleChildScrollView(

        child: Column(
        children: [
          ///trending seller//
          StreamBuilder<List<TrendingSellerResponse>>(
            stream: homePageBloc.newShopController,
            builder: (context, trendingControllerSnapshot) {
              return
                trendingControllerSnapshot.hasData!=null && trendingControllerSnapshot.data!=null ?
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*.42,
                  width: MediaQuery.of(context).size.width*.95,
                  decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.circular(10),shape: BoxShape.rectangle,color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                  child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15,bottom: 8),
                        child: Text('Trending Sellers',style: TextStyle(color: Colors.black,fontSize: 18),),
                      ),
                      Container(height:MediaQuery.of(context).size.height*.35,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: trendingControllerSnapshot.data.length,
                          itemBuilder: (context, index) {
                            return TrendingSellersContainer(trendingControllerSnapshot.data[index])
                              ;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ):Center(child: CircularProgressIndicator(strokeWidth: 2.5,));
            }
          ),
          SizedBox(height: 10,),
          ///trending product///
          StreamBuilder<List<ProductResponse>>(
            stream: homePageBloc.productController,
            builder: (context, productControllerSnapshot) {
              return
                productControllerSnapshot.hasData!=null && productControllerSnapshot.data!=null ?
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*.42,
                  width: MediaQuery.of(context).size.width*.95,
                  decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.circular(10),shape: BoxShape.rectangle,color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                  child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15,bottom: 8),
                        child: Text('Trending Products',style: TextStyle(color: Colors.black,fontSize: 18),),
                      ),
                      Container(height:MediaQuery.of(context).size.height*.35,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: productControllerSnapshot.data.length,
                          itemBuilder: (context, index) {
                            return TrendingProductContainer(productControllerSnapshot.data[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ):Center(child: CircularProgressIndicator(strokeWidth: 2.5,));
            }
          ),
          SizedBox(height: 10,),
          ///product service//
          StreamBuilder<List<ProductServiceResponse>>(
          stream: homePageBloc.productServiceController,
          builder: (context, productServiceSnapshot) {
            return
              productServiceSnapshot.hasData!=null && productServiceSnapshot.data!=null ?
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:3 ,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                return  ProductServiceContainer(productServiceSnapshot.data[index]);
              })
                :Center(child: CircularProgressIndicator(strokeWidth: 2.5,));
          }
            ),
          SizedBox(height: 10,),
          ///new arrival///
          StreamBuilder<List<ProductResponse>>(
              stream: homePageBloc.newArrival,
              builder: (context, newArrivalSnapshot) {
                return
                  newArrivalSnapshot.hasData!=null && newArrivalSnapshot.data!=null ?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    Container(
                      height: MediaQuery.of(context).size.height*.42,
                      width: MediaQuery.of(context).size.width*.95,
                      decoration:
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(10),shape: BoxShape.rectangle,color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 15,bottom: 8),
                            child: Text('New Arrivals',style: TextStyle(color: Colors.black,fontSize: 18),),
                          ),
                          Container(height:MediaQuery.of(context).size.height*.35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: newArrivalSnapshot.data.length,
                              itemBuilder: (context, index) {
                                return NewArrivalContainer(newArrivalSnapshot.data[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ):Center(child: CircularProgressIndicator(strokeWidth: 2.5,));
              }
          ),
          SizedBox(height: 10,),
          /// product service//
          StreamBuilder<List<ProductServiceResponse>>(
              stream: homePageBloc.productServiceController,
              builder: (context, productServiceSnapshot) {
                return
                  productServiceSnapshot.hasData!=null && productServiceSnapshot.data!=null ?
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:3,
                      shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return  ProductServiceContainer(productServiceSnapshot.data[index+3]);
                      })
                      :Center(child: CircularProgressIndicator(strokeWidth: 2.5,));
              }
          ),
          SizedBox(height: 10,),
          ///new shop//
          StreamBuilder<List<TrendingSellerResponse>>(
              stream: homePageBloc.newShopController,
              builder: (context, newShopSnapshot) {
                return
                  newShopSnapshot.hasData!=null && newShopSnapshot.data!=null ?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height*.42,
                      width: MediaQuery.of(context).size.width*.95,
                      decoration:
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(10),shape: BoxShape.rectangle,color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 15,bottom: 8),
                            child: Text('New Shops',style: TextStyle(color: Colors.black,fontSize: 18),),
                          ),
                          Container(height:MediaQuery.of(context).size.height*.35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: newShopSnapshot.data.length,
                              itemBuilder: (context, index) {
                                return NewShopsContainer(newShopSnapshot.data[index])
                                ;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ):Center(child: CircularProgressIndicator(strokeWidth: 2.5,));
              }
          ),
          SizedBox(height: 10,),
          StreamBuilder<List<ProductServiceResponse>>(
              stream: homePageBloc.productServiceController,
              builder: (context, productServiceSnapshot) {
                return
                  productServiceSnapshot.hasData!=null && productServiceSnapshot.data!=null ?
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:productServiceSnapshot.data.length-6,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return  ProductServiceContainer(productServiceSnapshot.data[index+6]);
                      })
                      :Center(child: CircularProgressIndicator(strokeWidth: 2.5,));
              }
          ),
        ],),
      ),
    );
  }
}