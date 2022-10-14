import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/countriesController.dart';
import '../constants/constant.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  // Calling  Countries Controller  using Getx
  final CountriesController controller = Get.put(CountriesController());

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Countries"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: MySize.size10),
                  child: RefreshIndicator(
                      onRefresh: controller.countriesApi,
                      child: Builder(builder: (context) {
                        return Obx(() {
                          if (controller.isLoading.value) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                              itemCount: controller.countryListing.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: MySize.size10, right: MySize.size10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            66, 66, 66, 66),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: MySize.size10,
                                              top: MySize.size14),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.network(
                                                controller
                                                    .countryListing[index].image
                                                    .toString(),
                                                // if url in Image.Network Doesn't work!!
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Container(
                                                    color: Colors.amber,
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      'No Image!',
                                                    ),
                                                  );
                                                },
                                                fit: BoxFit.contain,
                                                width: MySize.size60,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    left: MySize.size20,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .countryListing[
                                                                index]
                                                            .countryName!,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: MySize
                                                                    .size10,
                                                                bottom: MySize
                                                                    .size10,
                                                                right: MySize
                                                                    .size10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                "Phone Code:${controller.countryListing[index].phoneCode!}"),
                                                            Text(
                                                                "ISO Code:${controller.countryListing[index].isoCode3!}"),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        });
                      }))))
        ],
      ),
    );
  }
}
