/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
class RestaurantSearchModel {
    String? id;
    String? name;
    String? description;
    String? pictureId;
    String? city;
    double? rating;

    RestaurantSearchModel({this.id, this.name, this.description, this.pictureId, this.city, this.rating}); 

    RestaurantSearchModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        description = json['description'];
        pictureId = json['pictureId'];
        city = json['city'];
        rating = json['rating'];
    }

}

class Root {
    bool? error;
    int? founded;
    List<RestaurantSearchModel?>? restaurants;

    Root({this.error, this.founded, this.restaurants}); 

    Root.fromJson(Map<String, dynamic> json) {
        error = json['error'];
        founded = json['founded'];
        if (json['restaurants'] != null) {
         restaurants = <RestaurantSearchModel>[];
         json['restaurants'].forEach((v) {
         restaurants!.add(RestaurantSearchModel.fromJson(v));
        });
      }
    }

}

