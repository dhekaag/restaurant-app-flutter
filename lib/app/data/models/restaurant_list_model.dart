/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = DataRestaurant.fromJson(map);
*/
class RestaurantListModel {
  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;

  RestaurantListModel(
      {this.id,
      this.name,
      this.description,
      this.pictureId,
      this.city,
      this.rating});

  RestaurantListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = json['rating'];
  }
}

class DataRestaurant {
  bool? error;
  String? message;
  int? count;
  List<RestaurantListModel?>? restaurants;

  DataRestaurant({this.error, this.message, this.count, this.restaurants});

  DataRestaurant.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    count = json['count'];
    if (json['restaurants'] != null) {
      restaurants = <RestaurantListModel>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(RestaurantListModel.fromJson(v));
      });
    }
  }
}
