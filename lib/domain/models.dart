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

class Customer {
  String id;
  String name;
  String numOfNotification;

  Customer(this.id, this.name, this.numOfNotification);
}

class Contacts {
  String phone;
  String email;
  String link;

  Contacts(this.phone, this.email, this.link);
}


class Authentication{
  Customer customer;
  Contacts contacts;

  Authentication(this.customer, this.contacts);
}


