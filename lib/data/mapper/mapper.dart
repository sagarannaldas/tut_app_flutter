//to convert the response into a non nullable object (model)

import 'package:tut_app_flutter/app/extensions.dart';
import 'package:tut_app_flutter/domain/model.dart';

import '../responses/responses.dart';

const empty = "";
const zero = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id?.orEmpty() ?? empty,
        this?.name?.orEmpty() ?? empty,
        this?.numOfNotifications?.orZero() ?? zero);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(this?.phone?.orEmpty() ?? empty,
        this?.email?.orEmpty() ?? empty, this?.link?.orEmpty() ?? empty);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        this?.customer?.toDomain(), this?.contacts?.toDomain());
  }
}
