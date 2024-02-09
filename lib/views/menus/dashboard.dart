import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technupur/network_service/dio_client.dart';
import 'package:technupur/view_model/home_provider.dart';
import 'package:technupur/views/widgets/customText.dart';
import 'package:technupur/views/widgets/homeItem.dart';

import '../../network_service/repository/homeRepository.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../baseWidget.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeRepository>(
      model: HomeRepository(
        apiService: Provider.of<ApiService>(context),
      ),
      onModelReady: (HomeRepository model) => model.initModel(),
      builder: (BuildContext context, HomeRepository model, _) {
        return Scaffold(
            backgroundColor: pageBackgroundColor,
            appBar: AppBar(
              leading: Image.asset(drawer),
              title: Image.asset(appBarLogo),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset(search),
                )
              ],
            ),
            body: model.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  )
                : setView(context, model));
      },
    );
  }

  Widget setView(BuildContext context, HomeRepository model) {
    if (model.loading) {
      const Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      );
    }

    return setData(context, model);
  }

  setData(BuildContext context, HomeRepository model) {
    return Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          homeProvider.subCatList = model.categoryList[homeProvider.catSelectedIndex].subCategory;
          homeProvider.productsList = homeProvider.subCatList[homeProvider.subCatSelectedIndex].products;
        return SingleChildScrollView(
          child: Column(
            children: [
              Divider(color: greyColor.withOpacity(0.5),),
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.categoryList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return categoryItem(context, model.categoryList[index], index, homeProvider);
                    }),
              ),

              Divider(color: greyColor.withOpacity(0.5),),
              Container(
                height: 100,
                margin: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:homeProvider.subCatList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return subCategoryItem(context, homeProvider.subCatList[index], index, homeProvider);
                    }),
              ),

              Container(
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    RichText(
                      text: TextSpan(
                          text: 'Products', style: TextStyle(color: primaryColor,  fontSize: 20.0, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(text: '(${homeProvider.selectedSubCategory})', style: TextStyle( color: primaryColor, fontSize: 10.0)),
                          ]
                      ),

                    ),

                    Row(
                      children: [

                        CustomText(text: 'View all', fontSize: 14.0, color: primaryColor,),
                        SizedBox(width: 3,),
                        Icon(Icons.arrow_forward_ios_rounded, color: blackColor, size: 10,)
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 300,
                margin: const EdgeInsets.symmetric(horizontal: 10),

                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.categoryList[homeProvider.catSelectedIndex].subCategory[homeProvider.subCatSelectedIndex].products.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return productsItem(context, model.categoryList[homeProvider.catSelectedIndex].subCategory[homeProvider.subCatSelectedIndex].products[index], homeProvider);
                    }),
              ),
              SizedBox(height: 20,),

              Image.asset(shippingBanner),
              SizedBox(height: 20,),
              Image.asset(newsLetter),


            ],
          ),
        );
      }
    );
  }
}
