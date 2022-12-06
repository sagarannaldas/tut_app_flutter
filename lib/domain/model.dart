class SliderObject {
  late String title;
  late String subTitle;
  late String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class Customer {
  late String id;
  late String name;
  late int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts {
  late String email;
  late String phone;
  late String link;

  Contacts(this.phone, this.email, this.link);
}

class Authentication {
  late Customer? customer;
  late Contacts? contacts;

  Authentication(this.customer, this.contacts);
}
