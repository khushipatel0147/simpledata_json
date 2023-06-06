
class UserModal {
  int? id;
  String? name, username, email, phone, website;
  AddressModal? addressModal;
  CompanyModal? companyModal;

  UserModal(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.website,
      this.addressModal,
      this.companyModal});

  factory UserModal.fromjson(Map m1) {
    return UserModal(
        email: m1['email'],
        name: m1['name'],
        addressModal: AddressModal.fromjson(m1['address']),
        companyModal: CompanyModal.fromjson(m1['company']),
        id: m1['id'],
        phone: m1['phone'],
        username: m1['username'],
        website: m1['website']);
  }
}

class CompanyModal {
  String? catchPhrase, bs, name;

  CompanyModal({this.catchPhrase, this.bs, this.name});

  factory CompanyModal.fromjson(Map m1) {
    return CompanyModal(
        name: m1['name'], bs: m1['bs'], catchPhrase: m1['catchPhrase']);
  }
}

class AddressModal {
  String? street, suite, city, zipcode;

  AddressModal({this.street, this.suite, this.city, this.zipcode, this.geo});

  Geoloca? geo;

  factory AddressModal.fromjson(Map m1) {
    return AddressModal(
        city: m1['city'],
        geo: Geoloca.fromjson(m1['geo']),
        street: m1['street'],
        suite: m1['suite'],
        zipcode: m1['zipcode']);
  }
}

class Geoloca {
  String? lat, lng;

  Geoloca({this.lat, this.lng});

  factory Geoloca.fromjson(Map m1) {
    return Geoloca(lat: m1['lat'], lng: m1['lng']);
  }
}
