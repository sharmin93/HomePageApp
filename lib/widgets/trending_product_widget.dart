import 'package:flutter/material.dart';
import 'package:home_page_app/api_response/trending_product_response.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:home_page_app/api_utils/image_util.dart';
class TrendingProductContainer extends StatelessWidget {
  ProductResponse data;

  TrendingProductContainer(this.data);

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
        child:  Column(
          children: [
            FutureBuilder(
              future: ImageUtil.getImageFile(data.productImage),
              builder: (context,dataFile){
              return  dataFile.hasData?
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  child: Image.file(dataFile.data,
                    height: MediaQuery.of(context).size.height * .22,
                    width: MediaQuery.of(context).size.width * .35,
                    fit: BoxFit.cover,
                  ),
                ),
              ):Container();
            },

            ),
            Container(
              width:MediaQuery.of(context).size.width*.35,
              height: MediaQuery.of(context).size.height*.10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8,right: 8,bottom: 8,left: 8),
                    child: AutoSizeText(data.productName,style: TextStyle(color: Colors.black,fontSize: 14),maxLines: 1,overflow:   TextOverflow.ellipsis,),
                  ),
                  Center(child: Text(data.unitPrice.toString(),style: TextStyle(color: Colors.black,fontSize: 14),)),
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}