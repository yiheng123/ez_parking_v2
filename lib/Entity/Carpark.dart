import "package:ezparking/Entity/Review.dart";


class Carpark{
  int _id;
  String _carParkNo;
  String _address;
  double _xCoord;
  double _yCoord;
  String _carParkType;
  String _shortTermParking;
  String _freeParking;
  String _nightParking;
  int _carParkDecks;
  double _gantryHeight;
  String _carParkBasement;
  int _maxSlot;
  int _currentSlot;

  Carpark(
      this._id,
      this._carParkNo,
      this._address,
      this._xCoord,
      this._yCoord,
      this._carParkType,
      this._shortTermParking,
      this._freeParking,
      this._nightParking,
      this._carParkDecks,
      this._gantryHeight,
      this._carParkBasement,
      this._maxSlot,
      this._currentSlot);
  Carpark.simple(int id, String carParkNo):_id= id, _carParkNo = carParkNo
  {
    this._address = " ";
    this._xCoord = 0.0;
    this._yCoord = 0.0;
    this._carParkType = "asd";
    this._shortTermParking = " ";
    this._freeParking = " ";
    this._nightParking = " ";
    this._carParkDecks = 2;
    this._gantryHeight = 0.0;
    this._carParkBasement = " ";
    this._maxSlot = 0;
    this._currentSlot = 0;
  }
  Carpark.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _carParkNo = map['carParkNo'];
    _address = map['address'];
    _xCoord = map['xCoord'];
    _yCoord = map['yCoord'];
    _carParkType = map['carParkType'];
    _shortTermParking = map['shortTermParking'];
    _freeParking = map['freeParking'];
    _nightParking = map['nightParking'];
    _carParkDecks = map['carParkDecks'];
    _gantryHeight = map['gantryHeight'];
    _carParkBasement = map['carParkBasement'];
    _maxSlot = map['maxSlot'];
    _currentSlot = map['currentSlot'];
  }
  String get carParkNo => _carParkNo;

  set carParkNo(String value) {
    _carParkNo = value;
  }

  // List get review => _review;
  //
  // set review(List<Review> value) {
  //   _review = value;
  // }
  //
  // void addReview(Review review){
  //   _review.add(review);
  // }
  //
  // void deleteReview(Review review){
  //   _review.remove(review);
  // }

  int get currentSlot => _currentSlot;

  set currentSlot(int value) {
    _currentSlot = value;
  }

  int get maxSlot => _maxSlot;

  set maxSlot(int value) {
    _maxSlot = value;
  }

  String get carParkBasement => _carParkBasement;

  set carParkBasement(String value) {
    _carParkBasement = value;
  }

  double get gantryHeight => _gantryHeight;

  set gantryHeight(double value) {
    _gantryHeight = value;
  }

  int get carParkDecks => _carParkDecks;

  set carParkDecks(int value) {
    _carParkDecks = value;
  }

  String get nightParking => _nightParking;

  set nightParking(String value) {
    _nightParking = value;
  }

  String get freeParking => _freeParking;

  set freeParking(String value) {
    _freeParking = value;
  }

  String get shortTermParking => _shortTermParking;

  set shortTermParking(String value) {
    _shortTermParking = value;
  }

  String get carParkType => _carParkType;

  set carParkType(String value) {
    _carParkType = value;
  }

  double get yCoord => _yCoord;

  set yCoord(double value) {
    _yCoord = value;
  }

  double get xCoord => _xCoord;

  set xCoord(double value) {
    _xCoord = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'carParkNo': _carParkNo,
      'address': _address,
      'xCoord': _xCoord,
      'yCoord': _yCoord,
      'carParkType': _carParkType,
      'shortTermParking': _shortTermParking,
      'freeParking': _freeParking,
      'nightParking':_nightParking,
      'carParkDecks':_carParkDecks,
      'gantryHeight':_gantryHeight,
      'carParkBasement':_carParkBasement,
      'maxSlot':_maxSlot,
      'currentSlot': _currentSlot,
    };
  }




}
