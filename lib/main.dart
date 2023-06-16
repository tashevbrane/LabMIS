import 'dart:io';
import 'package:flutter/material.dart';
import 'package:laboratoriski/forms/RegistrationForm.dart';
import 'package:laboratoriski/forms/loginform.dart';
import 'package:laboratoriski/model/user.dart';
import 'package:laboratoriski/widgets/nov_Ispit.dart';
import 'model/ispit.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(Labs());

class Labs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User? _currentUser;

  // final LatLng eventLocation =
  //     LatLng(41.996460, 21.431409); // Координати за местото на настанот
  // final Set<Marker> markers = Set<Marker>();

  List<User> _users = [];

  List<Ispit> _ispiti = [
    Ispit(
        id: "1", predmet: "APS", datumVreme: DateTime(2023, 6, 15, 14, 30, 0)),
    Ispit(
        id: "2", predmet: "MIS", datumVreme: DateTime(2023, 6, 15, 14, 30, 0)),
  ];

  void _addItemFunction(BuildContext ct) {
    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NovIspit(_addNewItemToList),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  void _registerUser(User user) {
    setState(() {
      _users.add(user);
      _currentUser = user;
    });
  }

  void _loginUser(User user) {
    if (user.username == "admin" && user.password == "admin") {
      setState(() {
        _currentUser = user;
      });
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Грешка"),
          content: Text("Невалидно корисничко име или лозинка."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text("ОК"),
            ),
          ],
        ),
      );
    }
  }

  void _logoutUser() {
    setState(() {
      _currentUser = null;
    });
  }

  void _addNewItemToList(Ispit item) {
    setState(() {
      _ispiti.add(item);
    });
  }

  void _deleteIspit(String id) {
    setState(() {
      _ispiti.removeWhere((element) => element.id == id);
    });
  }

  DateTime _selectedDate = DateTime.now();

  // @override
  // void initState() {
  //   super.initState();

  //   markers.add(
  //     Marker(
  //       markerId: MarkerId('event_location'),
  //       position: eventLocation,
  //       infoWindow: InfoWindow(title: 'Место на настанот'),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    if (_currentUser == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Испити"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoginForm(onLogin: _loginUser),
              SizedBox(height: 16),
              Text("Или"),
              SizedBox(height: 16),
              RegistrationForm(onRegister: _registerUser),
            ],
          ),
        ),
      );
    } else {
      final filteredIspiti = _ispiti.where((ispit) {
        final ispitDate = DateTime(
          ispit.datumVreme.year,
          ispit.datumVreme.month,
          ispit.datumVreme.day,
        );
        return ispitDate == _selectedDate;
      }).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text("Испити"),
          actions: <Widget>[
            IconButton(
              onPressed: () => _addItemFunction(context),
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: _logoutUser,
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              CalendarCarousel(
                onDayPressed: (DateTime date, List<dynamic> events) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
                weekendTextStyle: TextStyle(color: Colors.red),
                thisMonthDayBorderColor: Colors.grey,
                height: 420.0,
                selectedDateTime: _selectedDate,
              ),
              SizedBox(height: 10.0),
              filteredIspiti.isEmpty
                  ? Text("Нема испити")
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (ctx, index) {
                          return Card(
                            elevation: 3,
                            margin: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 10,
                            ),
                            child: ListTile(
                              title: Text(
                                filteredIspiti[index].predmet,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  "Датум: ${filteredIspiti[index].datumVreme.day}/${filteredIspiti[index].datumVreme.month}/${filteredIspiti[index].datumVreme.year}\nВреме:${filteredIspiti[index].datumVreme.hour}:${filteredIspiti[index].datumVreme.minute}"),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () =>
                                    _deleteIspit(filteredIspiti[index].id),
                              ),
                            ),
                          );
                        },
                        itemCount: filteredIspiti.length,
                      ),
                    ),
              // Container(
              //   height: 200,
              //   child: GoogleMap(
              //     initialCameraPosition: CameraPosition(
              //       target: eventLocation,
              //       zoom: 15,
              //     ),
              //     markers: markers,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  }
}
