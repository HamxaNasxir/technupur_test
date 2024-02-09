import 'package:flutter/material.dart';
import 'package:technupur/network_service/models/homeModel.dart';

class HomeProvider extends ChangeNotifier{

  int catSelectedIndex = 0;
  int subCatSelectedIndex = 0;
  String selectedCategory = "All";
  String selectedSubCategory = "";

  List<SubCategory> subCatList = [];
  List<Product> productsList = [];

  updateCatCurrentIndex(int index, String namee, MainModel catList){
    catSelectedIndex = index;
    selectedCategory = namee;
    subCatList = catList.subCategory;
    notifyListeners();
  }

  updateSubCatCurrentIndex(int index, String name, SubCategory subCategory){
    subCatSelectedIndex = index;
    selectedSubCategory = name;
    productsList = subCategory.products;
    notifyListeners();
  }
}