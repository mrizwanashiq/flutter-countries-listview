import 'dart:async';

import 'package:flutter_task/Models/Countries.dart';
import 'package:get/get.dart';
import '../Services/remoteServices.dart';

class CountriesController extends GetxController {
  var isLoading = true.obs;
  var countriesData = Countries().obs;
  List countryListing = [].obs;
  var loader = true.obs;
  @override
  void onInit() {
    super.onInit();
    countriesApi().then((value) {
      //Removing  after every 10 second
      Timer.periodic(const Duration(seconds: 10), (timer) {
        isLoading(true);
        countryListing.removeAt(0);
        isLoading(false);
      });
    });
  }

// calling Api
  Future countriesApi() async {
    try {
      isLoading(true);
      var jsonData = await RemoteServices.fetchData();
      if (jsonData != null) {
        countriesData.value = jsonData;
        countryListing = [...countriesData.value.data!.data!.countries!];
      }
    } finally {
      isLoading(false);
    }
  }
}
