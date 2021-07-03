import 'package:flutter/material.dart';
import 'package:home_page_app/api_response/trending_seller_response.dart';
class TrendingSellersContainer extends StatelessWidget {
  TrendingSellerResponse data;

  TrendingSellersContainer(this.data);

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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                height: MediaQuery.of(context).size.height * .35,
                width: MediaQuery.of(context).size.width * .35,
                image: NetworkImage(data.sellerItemPhoto),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: CircleAvatar(
                backgroundImage:
                NetworkImage(data.sellerProfilePhoto),
                radius: 15,
              ),
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