import 'package:flutter/material.dart';
import 'package:home_page_app/api_response/trending_product_response.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:home_page_app/api_response/product_servive_response.dart';
import 'package:home_page_app/api_utils/image_util.dart';
import 'package:intl/intl.dart';
import 'dart:io';
class ProductServiceContainer extends StatelessWidget {
  ProductServiceResponse data;

  ProductServiceContainer(this.data);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height*.50,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: ImageUtil.getImageFile(data.shopLogo),
                    builder: (context,dataFile){
                    return dataFile.hasData?Padding(
                      padding: const EdgeInsets.all(6.0),
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(dataFile.data,
                          height: MediaQuery.of(context).size.height*0.05,
                          width: MediaQuery.of(context).size.height*0.05,
                          fit: BoxFit.cover,),


                      )
                    ):Container();
                  },


                  ),
                  SizedBox(width: 10,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15,),
                        child: Text(data.shopName,style: TextStyle(color: Colors.black,fontSize: 18),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 15,bottom: 8),
                        child: Text(data.friendlyTimeDiff,style: TextStyle(color: Colors.black,fontSize: 12),),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(data.story,style: TextStyle(fontSize: 14,color: Colors.black),),
              ),
              FutureBuilder(future: ImageUtil.getImageFile(data.storyImage),
                builder: (context, dataFile){
                return dataFile.hasData?
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(dataFile.data,
                      height: MediaQuery.of(context).size.height * .25,
                      width:  MediaQuery.of(context).size.width*.95,
                      fit: BoxFit.cover,
                    ),

                  )
                ):Container();
              },


              ),
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Row(children: [
                    Icon(Icons.card_giftcard),
                    SizedBox(width: 6,),
                    Text(data.unitPrice.toString())
                  ],),
                ),
                Row(children: [
                  Icon(Icons.menu),
                  SizedBox(width: 6,),
                  Text('${data.availableStock.toString()} available stock')
                ],),
                Padding(
                  padding: const EdgeInsets.only(right:6),
                  child: Row(children: [
                    Icon(Icons.shopping_cart_outlined),
                    SizedBox(width: 6,),
                    Text('${data.orderQty.toString()} order(s)')
                  ],),
                ),
              ],),
            ],
          ),
        ),
      );
  }
}