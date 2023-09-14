// onBoarding Models
class SliderObject {
  final String title;
  final String subtitle;
  final String image;

  SliderObject(
      {required this.title, required this.subtitle, required this.image});
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

//login models

class CustomerModel {
  String id;
  String name;
  int numOfNotification;

  CustomerModel(this.id, this.name, this.numOfNotification);
}

class ContactsModel {
  String phone;
  String email;
  String link;

  ContactsModel(this.phone, this.email, this.link);
}

class AuthenticationModel {
  CustomerModel? customer;
  ContactsModel? contacts;

  AuthenticationModel(this.customer, this.contacts);
}
