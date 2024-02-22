/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = DetailDataRestaurant.fromJson(map);
*/ 
class Category {
    String? name;

    Category({this.name}); 

    Category.fromJson(Map<String, dynamic> json) {
        name = json['name'];
    }

}

class CustomerReview {
    String? name;
    String? review;
    String? date;

    CustomerReview({this.name, this.review, this.date}); 

    CustomerReview.fromJson(Map<String, dynamic> json) {
        name = json['name'];
        review = json['review'];
        date = json['date'];
    }

}

class Drink {
    String? name;

    Drink({this.name}); 

    Drink.fromJson(Map<String, dynamic> json) {
        name = json['name'];
    }

}

class Food {
    String? name;

    Food({this.name}); 

    Food.fromJson(Map<String, dynamic> json) {
        name = json['name'];
    }

}

class Menus {
    List<Food?>? foods;
    List<Drink?>? drinks;

    Menus({this.foods, this.drinks}); 

    Menus.fromJson(Map<String, dynamic> json) {
        if (json['foods'] != null) {
         foods = <Food>[];
         json['foods'].forEach((v) {
         foods!.add(Food.fromJson(v));
        });
      }
        if (json['drinks'] != null) {
         drinks = <Drink>[];
         json['drinks'].forEach((v) {
         drinks!.add(Drink.fromJson(v));
        });
      }
    }

}

class RestaurantDetailModel {
    String? id;
    String? name;
    String? description;
    String? city;
    String? address;
    String? pictureId;
    List<Category?>? categories;
    Menus? menus;
    double? rating;
    List<CustomerReview?>? customerReviews;

    RestaurantDetailModel({this.id, this.name, this.description, this.city, this.address, this.pictureId, this.categories, this.menus, this.rating, this.customerReviews}); 

    RestaurantDetailModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        name = json['name'];
        description = json['description'];
        city = json['city'];
        address = json['address'];
        pictureId = json['pictureId'];
        if (json['categories'] != null) {
         categories = <Category>[];
         json['categories'].forEach((v) {
         categories!.add(Category.fromJson(v));
        });
      }
        menus = json['menus'] != null ? Menus?.fromJson(json['menus']) : null;
        rating = json['rating'];
        if (json['customerReviews'] != null) {
         customerReviews = <CustomerReview>[];
         json['customerReviews'].forEach((v) {
         customerReviews!.add(CustomerReview.fromJson(v));
        });
      }
    }

}

class DetailDataRestaurant {
    bool? error;
    String? message;
    RestaurantDetailModel? restaurant;

    DetailDataRestaurant({this.error, this.message, this.restaurant}); 

    DetailDataRestaurant.fromJson(Map<String, dynamic> json) {
        error = json['error'];
        message = json['message'];
        restaurant = json['restaurant'] != null ? RestaurantDetailModel?.fromJson(json['restaurant']) : null;
    }

}

