import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_page_app/api_response/trending_seller_response.dart';
import 'package:home_page_app/api_utils/image_util.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
class NewShopsContainer extends StatelessWidget {
  TrendingSellerResponse data;

  NewShopsContainer(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height*.35,
        width: MediaQuery.of(context).size.width*.35,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),shape: BoxShape.rectangle),
        child:  Stack(
          children: [
            FutureBuilder(future: ImageUtil.getImageFile(data.sellerItemPhoto),
              builder: (context, dataFile){
                return dataFile.hasData?  ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(dataFile.data,
                    height: MediaQuery.of(context).size.height*.35,
                    width: MediaQuery.of(context).size.width*.35,
                    fit: BoxFit.cover,
                  ),
                ):Container();
              },


            ),
            FutureBuilder(future: ImageUtil.getImageFile(data.sellerProfilePhoto),
              builder: (context, dataFile){
                return  dataFile.hasData?Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(dataFile.data,
                      height: MediaQuery.of(context).size.height*0.05,
                      width: MediaQuery.of(context).size.height*0.05,
                      fit: BoxFit.cover,
                    ),


                  ),
                ):Container();
              },


            ),
            Positioned(top: MediaQuery.of(context).size.height*.23,
              child: Container(
                width:MediaQuery.of(context).size.width*.35,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),),),
                height: MediaQuery.of(context).size.height*.35*.33,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                  child: Text(data.sellerName,style: TextStyle(color: Colors.white,fontSize: 14),),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}