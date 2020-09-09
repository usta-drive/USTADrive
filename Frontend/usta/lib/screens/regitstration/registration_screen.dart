import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:usta/models/gender.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart' as customicons;
import 'package:international_phone_input/international_phone_input.dart';
import 'package:usta/models/registration.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

const kGoogleApiKey = "AIzaSyB1_II757QF-XI1Li4ADq-RtK0zovM6SWM";

class UstaRegistration_screen extends StatefulWidget {
  @override
  _UstaRegistration_screenState createState() =>
      _UstaRegistration_screenState();
}

class _UstaRegistration_screenState extends State<UstaRegistration_screen> {
  final _form = GlobalKey<FormState>();
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
  String _firstName = '';
  String _lastName;
  String _email;
  String _password;
  String _address = '';
  String _selectedGeneder = "Female";
  bool _isStudent, _isInstructer;

  String _phoneNumber;
  String _phoneIsoCode;
  bool visible = false;
  String _confirmedNumber = '';

  var _registered_user = Registration(
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    address: '',
    geneder: '',
    isInstructer: false,
    isStudent: false,
    phoneNumber: '',
  );

  final _firstNameFocus = FocusNode();
  final _lastNameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmpasswordFocus = FocusNode();
  final _addressFocus = FocusNode();

  var _isInit = true;

  List<bool> _isSelected = [false, false];
  var _address_controller = TextEditingController();
  var _phonenumberController = TextEditingController();
  String initialCountry = 'US';
  PhoneNumber _phone = PhoneNumber(isoCode: 'US');

  List _genders = [
    const Gender('Male', Icon(customicons.MdiIcons.humanMale)),
    const Gender('Female', Icon(customicons.MdiIcons.humanFemale)),
    const Gender('Transgender', Icon(customicons.MdiIcons.genderTransgender)),
    const Gender('Non-Binary', Icon(customicons.MdiIcons.genderNonBinary)),
    const Gender('Other', Icon(customicons.MdiIcons.genderMaleFemaleVariant)),
  ].toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmpasswordFocus.dispose();
    _addressFocus.dispose();
    _address_controller.dispose();
    _phonenumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Form(
                key: _form,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      initialValue: '',
                      decoration: InputDecoration(labelText: "First Name"),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_lastNameFocus);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter First Name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _firstName = value;
                        _registered_user = Registration(
                          firstName: value,
                          lastName: _registered_user.lastName,
                          email: _registered_user.email,
                          password: _registered_user.password,
                          address: _registered_user.address,
                          geneder: _registered_user.geneder,
                          isInstructer: _registered_user.isInstructer,
                          isStudent: _registered_user.isStudent,
                          phoneNumber: _registered_user.phoneNumber,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: '',
                      decoration: InputDecoration(labelText: "Last Name"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_emailFocus);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Last Name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _registered_user = Registration(
                          firstName: _registered_user.firstName,
                          lastName: value,
                          email: _registered_user.email,
                          password: _registered_user.password,
                          address: _registered_user.address,
                          geneder: _registered_user.geneder,
                          isInstructer: _registered_user.isInstructer,
                          isStudent: _registered_user.isStudent,
                          phoneNumber: _registered_user.phoneNumber,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: '',
                      decoration: InputDecoration(labelText: "Email"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_passwordFocus);
                      },
                      onSaved: (value) {
                        //print(value);
                        _registered_user = Registration(
                          firstName: _registered_user.firstName,
                          lastName: _registered_user.lastName,
                          email: value,
                          password: _registered_user.password,
                          address: _registered_user.address,
                          geneder: _registered_user.geneder,
                          isInstructer: _registered_user.isInstructer,
                          isStudent: _registered_user.isStudent,
                          phoneNumber: _registered_user.phoneNumber,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: '',
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_confirmpasswordFocus);
                      },
                      onSaved: (value) {
                        //print(value);
                      },
                    ),
                    TextFormField(
                      initialValue: '',
                      decoration:
                          InputDecoration(labelText: "Confirm Password"),
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_addressFocus);
                      },
                      onSaved: (value) {
                        // print(value);
                        _registered_user = Registration(
                          firstName: _registered_user.firstName,
                          lastName: _registered_user.lastName,
                          email: _registered_user.email,
                          password: value,
                          address: _registered_user.address,
                          geneder: _registered_user.geneder,
                          isInstructer: _registered_user.isInstructer,
                          isStudent: _registered_user.isStudent,
                          phoneNumber: _registered_user.phoneNumber,
                        );
                      },
                    ),
                    TextFormField(
                      controller: _address_controller,
                      //initialValue: _address,
                      decoration: InputDecoration(labelText: "Address"),
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Address';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {},
                      onSaved: (value) {
                        //print(value);
                        _registered_user = Registration(
                          firstName: _registered_user.firstName,
                          lastName: _registered_user.lastName,
                          email: _registered_user.email,
                          password: _registered_user.password,
                          address: value,
                          geneder: _registered_user.geneder,
                          isInstructer: _registered_user.isInstructer,
                          isStudent: _registered_user.isStudent,
                          phoneNumber: _registered_user.phoneNumber,
                        );
                      },
                      onChanged: (text) async {
                        Prediction p = await PlacesAutocomplete.show(
                          context: context,
                          apiKey: kGoogleApiKey,
                          mode: Mode.overlay,
                          onError: onError,
                          language: "us",
                          components: [new Component(Component.country, "us")],
                        );
                        print(p.placeId);
                        print(p.description);
                        _address_controller.text = p.description.toString();
                        _address = p.description.toString();
                      },
                    ),
                    DropdownButton(
                      isExpanded: true,
                      value: _selectedGeneder,
                      items: _genders.map(
                        (gender) {
                          return DropdownMenuItem(
                            value: gender.name,
                            child: Row(
                              children: <Widget>[
                                gender.icon,
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(gender.name,style: TextStyle(color: Colors.black),),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                      //value: _currentSelectedItem,
                      onChanged: (value) {
                        setState(() {
                          _selectedGeneder = value;
                          print(_selectedGeneder);
                          _registered_user = Registration(
                            firstName: _registered_user.firstName,
                            lastName: _registered_user.lastName,
                            email: _registered_user.email,
                            password: _registered_user.password,
                            address: _registered_user.address,
                            geneder: _selectedGeneder,
                            isInstructer: _registered_user.isInstructer,
                            isStudent: _registered_user.isStudent,
                            phoneNumber: _registered_user.phoneNumber,
                          );
                        });
                      },
                    ),
                    ToggleButtons(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("  Instructer   "),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(customicons.MdiIcons.teach),
                            SizedBox(
                              width: 6,
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("  Student  "),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(customicons.MdiIcons.book),
                            SizedBox(
                              width: 6,
                            ),
                          ],
                        ),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int buttonIndex = 0;
                              buttonIndex < _isSelected.length;
                              buttonIndex++) {
                            if (buttonIndex == index) {
                              _isSelected[buttonIndex] = true;
                              _isInstructer = true;
                              _isStudent = false;
                            } else {
                              _isSelected[buttonIndex] = false;
                              _isInstructer = false;
                              _isStudent = true;
                            }

                          }
                          _registered_user = Registration(
                            firstName: _registered_user.firstName,
                            lastName: _registered_user.lastName,
                            email: _registered_user.email,
                            password: _registered_user.password,
                            address: _registered_user.address,
                            geneder: _selectedGeneder,
                            isInstructer: _isInstructer,
                            isStudent:_isStudent,
                            phoneNumber: _registered_user.phoneNumber,
                          );
                        });
                      },
                      isSelected: _isSelected,
                    ),
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        setState(() {
                          _confirmedNumber= number.phoneNumber;
                        });
                         // print(_confirmedNumber);
                      },
                      onInputValidated: (bool value) {
                        onValidPhoneNumber;
                      },
                      onSaved: (_){
                        _registered_user = Registration(
                          firstName: _registered_user.firstName,
                          lastName: _registered_user.lastName,
                          email: _registered_user.email,
                          password: _registered_user.password,
                          address: _registered_user.address,
                          geneder: _selectedGeneder,
                          isInstructer: _registered_user.isInstructer,
                          isStudent: _registered_user.isStudent,
                          phoneNumber: _confirmedNumber,
                        );
                      },
                      ignoreBlank: false,
                      autoValidate: false,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: _phone ,
                      textFieldController: _phonenumberController,
                        countries:['US'],
                        maxLength:12,
                    ),
                  ],
                ),
              ),
              RaisedButton(
                  child: Text('Registrer'),
                  onPressed: () {
                    if (_form.currentState.validate()) {
                      _form.currentState.save();
                      print("=========Form Validated=========");
                      print("firstName: '${_registered_user.firstName}'");
                      print("LastName: '${_registered_user.lastName}'");
                      print("Email: '${_registered_user.email}'");
                      print("Password: '${_registered_user.password}'");
                      print("Address: '${_registered_user.address}'");
                      print("Gender: '${_registered_user.geneder}'");
                      print("IsInstructer: '${_registered_user.isInstructer}'");
                      print("IsStudent: '${_registered_user.isStudent}'");
                      print("Phone Number: '${_registered_user.phoneNumber}'");

                      _form.currentState.reset();
                      _phonenumberController.text='';
                      _address_controller.text='';
                      _selectedGeneder = "Female";
                      _isInstructer = false;
                      _isStudent = false;

                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);

      var placeId = p.placeId;
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      var address = await Geocoder.local.findAddressesFromQuery(p.description);

      print(lat);
      print(lng);
      //print(p.description);
    }
  }

  void onError(PlacesAutocompleteResponse response) {
    print(response.errorMessage);
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      _phone = number;
    });
  }

  onValidPhoneNumber(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      visible = true;


    });
  }

  void onPhoneNumberChange(String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      _phoneNumber = number;
      _phoneIsoCode = isoCode;


    });
  }
}
