import 'dart:convert';

Countries countriesFromJson(String str) => Countries.fromJson(json.decode(str));

String countriesToJson(Countries data) => json.encode(data.toJson());

class Countries {
  Countries({
    this.meta,
    this.data,
  });

  Meta? meta;
  CountriesData? data;

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        meta: Meta.fromJson(json["meta"]),
        data: CountriesData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta!.toJson(),
        "data": data!.toJson(),
      };
}

class CountriesData {
  CountriesData({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  DataData? data;

  factory CountriesData.fromJson(Map<String, dynamic> json) => CountriesData(
        status: json["status"],
        message: json["message"],
        data: DataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class DataData {
  DataData({
    this.countries,
  });

  List<Country>? countries;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries!.map((x) => x.toJson())),
      };
}

class Country {
  Country({
    this.countryId,
    this.countryName,
    this.countryCode,
    this.phoneCode,
    this.isoCode3,
    this.status,
    this.image,
  });

  String? countryId;
  String? countryName;
  String? countryCode;
  String? phoneCode;
  String? isoCode3;
  String? status;
  String? image;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryId: json["country_id"],
        countryName: json["country_name"],
        countryCode: json["country_code"],
        phoneCode: json["phone_code"],
        isoCode3: json["iso_code_3"],
        status: json["status"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "country_id": countryId,
        "country_name": countryName,
        "country_code": countryCode,
        "phone_code": phoneCode,
        "iso_code_3": isoCode3,
        "status": status,
        "image": image,
      };
}

class Meta {
  Meta({
    this.status,
    this.response,
    this.message,
  });

  int? status;
  String? response;
  String? message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        status: json["status"],
        response: json["response"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
        "message": message,
      };
}
