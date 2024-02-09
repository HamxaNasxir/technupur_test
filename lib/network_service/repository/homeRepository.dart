import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:technupur/network_service/repository/baseRepository.dart';

import '../../utils/constants.dart';
import '../dio_client.dart';
import '../models/homeModel.dart';


class HomeRepository extends BaseRepository {
  final ApiService apiService;
  final Connectivity connectivity = Connectivity();

  HomeRepository({required this.apiService});

  List<MainModel> categoryList = [];

  List<MainModel> get getCategoryList => categoryList;

  @override
  Future<void> initModel() async {

    try {
      // Check for internet connectivity
      var connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        debugPrint('no internet connection');
      } else {
        setLoading(true);
        await getHomeData(AppConstants.getCategory);
        setLoading(false);
      }
      notifyListeners();
    } catch (e) {
      // Handle the error
      print('Error fetching data: $e');
    }
  }

  Future<dynamic> getHomeData(String url) async {

    try {
      final data = await apiService.get(url);

      return parseHomeResponse(data);
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  Future<List<dynamic>> parseHomeResponse(Response<dynamic> response) async {
    List jsonResponse = response.data;
      categoryList = jsonResponse.map((data) => MainModel.fromJson(data)).toList();
    return  categoryList;
  }
}
