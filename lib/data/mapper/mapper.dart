import 'package:clean_architecture_demo/app/constants.dart';
import 'package:clean_architecture_demo/app/extensions.dart';
import 'package:clean_architecture_demo/domain/model/models.dart';

import '../response/responses.dart';

extension CustomerResponseMapper on CustomerResponse? {
  CustomerModel toDomain() {
    return CustomerModel(
        this?.id.orEmpty() ?? Constants.empty,
        this?.name.orEmpty() ?? Constants.empty,
        this?.numOfNotification.orZero() ?? Constants.zero);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  ContactsModel toDomain() {
    return ContactsModel(
        this?.phone.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
        this?.link.orEmpty() ?? Constants.empty);
  }
}

extension AutheticationResponseMapper on AuthenticationResponse? {
  AuthenticationModel toDomain() {
    return AuthenticationModel(this?.customer.toDomain(), this?.contacts.toDomain());
  }
}
