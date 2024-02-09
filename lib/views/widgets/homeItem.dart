import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:technupur/network_service/models/homeModel.dart';
import 'package:technupur/view_model/home_provider.dart';
import 'package:technupur/utils/colors.dart';
import 'package:technupur/utils/images.dart';
import 'cachedImageWidget.dart';
import 'customText.dart';

categoryItem(BuildContext context, MainModel catModel, int index, HomeProvider homeProvider) {
  return GestureDetector(
      onTap: () {
        homeProvider.updateCatCurrentIndex(index, catModel.name!, catModel);

      },
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding:  const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: homeProvider.catSelectedIndex == index ? primaryColor : greyColor),
              ),
               padding: const EdgeInsets.all(6),
               child: CustomText(text: catModel.name,),
            ),
            Positioned(
              top: -5,
              right: -5,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: primaryColor),
                  color: whiteColor
                ),
                child: CustomText(text: catModel.subCategory.length.toString(), textAlign: TextAlign.center, fontSize: 8.0,),
              ),
            ),
          ],
        ),
      ));
}


subCategoryItem(BuildContext context, SubCategory subCatModel, int index, HomeProvider homeProvider) {
  return GestureDetector(
      onTap: () {
        homeProvider.updateSubCatCurrentIndex(index, subCatModel.name!, subCatModel);

      },
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding:  const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [


                Center(
                  child: CircleAvatar(
                    backgroundColor: homeProvider.subCatSelectedIndex == index ? primaryColor: greyColor.withOpacity(0.5),
                    radius: 30,
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 28,
                      child:  CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(subCatModel.image!), //NetworkImage
                        radius: 26,
                      ), //CircleAvatar
                    ), //CircleAvatar
                  ), //CircleAvatar
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: primaryColor),
                        color: whiteColor
                    ),
                    child: CustomText(text: subCatModel.products.length.toString(), textAlign: TextAlign.center, fontSize: 8.0,),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5,),
            CustomText(text: subCatModel.name,)
          ],
        ),
      ));
}

productsItem(BuildContext context, Product productModel, HomeProvider homeProvider) {
  return GestureDetector(
      onTap: () {

      },
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 200,
            margin: const EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 20,
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: cachedImage(productModel.image!)),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    color: Colors.green,
                    child: CustomText(
                      text: '${productModel.discountPercentage.toString()}%',
                      color: whiteColor,
                      fontSize: 10.0,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 15,
                  child: IconButton(
                    icon: Image.asset(fav),
                    onPressed: () {},
                  ),
                ),

              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6,),
              CustomText(
                text: homeProvider.selectedCategory,
                color: greyColor,
              ),

              Row(
                children: [
                  Text(
                    '\$${productModel.price.toString()}',

                    style: TextStyle(decoration: TextDecoration.lineThrough),),
                  SizedBox(width: 5,),
                  Text(
                    '\$${productModel.discountPercentage.toString()}',

                    style: TextStyle(color: primaryColor),)
                ],
              ),
              Container(
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.amber.withOpacity(0.3)
                ),
                child:  Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.amber
                  ),
                ),
              )

            ],
          ),


        ],
      ));
}
