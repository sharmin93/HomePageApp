import 'package:flutter/material.dart';
import 'package:home_page_app/api_response/trending_product_response.dart';
import 'package:auto_size_text/auto_size_text.dart';
class NewArrivalContainer extends StatelessWidget {
  ProductResponse data;

  NewArrivalContainer(this.data);

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
            SizedBox(
              height: MediaQuery.of(context).size.height*.22,
              width: MediaQuery.of(context).size.width*.35,
              child: ClipRRect(
                borderRadius:
                BorderRadius.circular(10.0),
                child: Image.network(data.productImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width:MediaQuery.of(context).size.width*.35,

              height: MediaQuery.of(context).size.height*.10,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8,right: 8,bottom: 8,left: 8),
                    child: AutoSizeText(data.productName,style: TextStyle(color: Colors.black,fontSize: 14),maxLines: 1,overflow:   TextOverflow.ellipsis,),
                  ),
                  Center(child: Text('Price: MRY${data.unitPrice.toString()}',style: TextStyle(color: Colors.black,fontSize: 14),)),
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}