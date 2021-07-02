import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_page_app/bloc/home_page_bloc.dart';
import 'package:home_page_app/widgets/trending_seller_widgets.dart';
import 'package:home_page_app/api_response/trending_seller_response.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var homePageBloc=HomePageBloc();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePageBloc.fetchTrendingSeller();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),),
      body: Container(
        height: MediaQuery.of(context).size.height*.95,
        child: Column(
        children: [

          StreamBuilder<List<TrendingSellerResponse>>(
            stream: homePageBloc.trendingController,
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
                    borderRadius: BorderRadius.circular(10),shape: BoxShape.rectangle,color: Colors.white
                ),
                  child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15,bottom: 8),
                        child: Text('Trending Sellers',style: TextStyle(color: Colors.black,fontSize: 16),),
                      ),
                      Container(height:MediaQuery.of(context).size.height*.35,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: false,
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
          )
      ],),),
    );
  }
}